// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import 'package:trale/core/daily_checkin.dart';
import 'package:trale/core/daily_checkin_database.dart';
import 'package:trale/core/icons.dart';
import 'package:trale/core/theme.dart';
import 'package:trale/core/traleNotifier.dart';
import 'package:trale/l10n-gen/app_localizations.dart';
import 'package:trale/widget/dialog.dart';
import 'package:trale/widget/tile_group.dart';

/// Show the daily check-in dialog
Future<bool> showDailyCheckInDialog({
  required BuildContext context,
  DailyCheckIn? existingCheckIn,
}) async {
  final TraleNotifier notifier = Provider.of<TraleNotifier>(
    context,
    listen: false,
  );

  final DailyCheckInDatabase database = DailyCheckInDatabase();
  
  // Get or create today's check-in
  final DailyCheckIn todayCheckIn = existingCheckIn ?? database.getTodayCheckIn();
  
  // Check if editable
  if (!todayCheckIn.canEdit && existingCheckIn == null) {
    // Show message that check-in is completed/immutable
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.checkInImmutable),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    return false;
  }

  // Create a mutable copy for editing
  late DailyCheckIn currentCheckIn = todayCheckIn;

  final Widget content = StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ===== Measurements Section =====
            _buildSectionHeader(context, AppLocalizations.of(context)!.measurementsSection),
            WidgetGroup(
              children: <Widget>[
                // Weight
                _buildNumericInput(
                  context: context,
                  label: AppLocalizations.of(context)!.weight,
                  value: currentCheckIn.weight,
                  icon: PhosphorIconsDuotone.scales,
                  onChanged: (value) {
                    setState(() {
                      currentCheckIn = currentCheckIn.copyWith(weight: value);
                    });
                  },
                ),
                // Height
                _buildNumericInput(
                  context: context,
                  label: AppLocalizations.of(context)!.height,
                  value: currentCheckIn.height,
                  icon: PhosphorIconsDuotone.ruler,
                  suffix: 'cm',
                  onChanged: (value) {
                    setState(() {
                      currentCheckIn = currentCheckIn.copyWith(height: value);
                    });
                  },
                ),
                // Neck
                _buildNumericInput(
                  context: context,
                  label: AppLocalizations.of(context)!.neck,
                  value: currentCheckIn.neck,
                  icon: PhosphorIconsDuotone.user,
                  suffix: 'cm',
                  onChanged: (value) {
                    setState(() {
                      currentCheckIn = currentCheckIn.copyWith(neck: value);
                    });
                  },
                ),
                // Waist
                _buildNumericInput(
                  context: context,
                  label: AppLocalizations.of(context)!.waist,
                  value: currentCheckIn.waist,
                  icon: PhosphorIconsDuotone.resize,
                  suffix: 'cm',
                  onChanged: (value) {
                    setState(() {
                      currentCheckIn = currentCheckIn.copyWith(waist: value);
                    });
                  },
                ),
                // BMI (computed, non-editable)
                GroupedListTile(
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  leading: PPIcon(PhosphorIconsDuotone.heartbeat, context),
                  title: Text(AppLocalizations.of(context)!.bmi),
                  trailing: Text(
                    currentCheckIn.bmi != null
                        ? currentCheckIn.bmi!.toStringAsFixed(1)
                        : '--',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                // Body Fat % (computed, non-editable)
                GroupedListTile(
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  leading: PPIcon(PhosphorIconsDuotone.percent, context),
                  title: Text(AppLocalizations.of(context)!.bodyFat),
                  trailing: Text(
                    currentCheckIn.bodyFatPercentage != null
                        ? '${currentCheckIn.bodyFatPercentage!.toStringAsFixed(1)}%'
                        : '--',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: TraleTheme.of(context)!.padding),

            // ===== Photos Section =====
            _buildSectionHeader(context, AppLocalizations.of(context)!.photosSection),
            WidgetGroup(
              children: <Widget>[
                _buildPhotosSection(
                  context: context,
                  photosPaths: currentCheckIn.photosPaths,
                  onPhotoAdded: (path) {
                    setState(() {
                      currentCheckIn = currentCheckIn.copyWith(
                        photosPaths: [...currentCheckIn.photosPaths, path],
                      );
                    });
                  },
                  onPhotoRemoved: (index) {
                    setState(() {
                      final newPhotos = List<String>.from(currentCheckIn.photosPaths);
                      newPhotos.removeAt(index);
                      currentCheckIn = currentCheckIn.copyWith(photosPaths: newPhotos);
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: TraleTheme.of(context)!.padding),

            // ===== Thoughts Section =====
            _buildSectionHeader(context, AppLocalizations.of(context)!.thoughtsSection),
            WidgetGroup(
              children: <Widget>[
                _buildThoughtsSection(
                  context: context,
                  thoughts: currentCheckIn.thoughts,
                  onChanged: (value) {
                    setState(() {
                      currentCheckIn = currentCheckIn.copyWith(thoughts: value);
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: TraleTheme.of(context)!.padding),

            // ===== Workout Section =====
            _buildSectionHeader(context, AppLocalizations.of(context)!.workoutSection),
            WidgetGroup(
              children: <Widget>[
                _buildWorkoutSection(
                  context: context,
                  workouts: currentCheckIn.workouts,
                  workoutTypes: database.workoutTypes,
                  workoutDurationMinutes: currentCheckIn.workoutDurationMinutes,
                  onWorkoutAdded: (workout) {
                    setState(() {
                      currentCheckIn = currentCheckIn.copyWith(
                        workouts: [...currentCheckIn.workouts, workout],
                      );
                    });
                  },
                  onWorkoutRemoved: (index) {
                    setState(() {
                      final newWorkouts = List<WorkoutEntry>.from(currentCheckIn.workouts);
                      newWorkouts.removeAt(index);
                      currentCheckIn = currentCheckIn.copyWith(workouts: newWorkouts);
                    });
                  },
                  onDurationChanged: (minutes) {
                    setState(() {
                      currentCheckIn = currentCheckIn.copyWith(
                        workoutDurationMinutes: minutes,
                      );
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: TraleTheme.of(context)!.padding),
          ],
        ),
      );
    },
  );

  final bool accepted = await showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return DialogM3E(
        title: AppLocalizations.of(context)!.dailyCheckIn,
        content: content,
        actions: <Widget>[
          FilledButton.icon(
            onPressed: () => Navigator.pop(context, false),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
            ),
            icon: PPIcon(PhosphorIconsRegular.x, context),
            label: Text(
              AppLocalizations.of(context)!.abort,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          FilledButton.icon(
            onPressed: () async {
              final bool wasSaved = await database.saveCheckIn(currentCheckIn);
              if (!context.mounted) return;
              Navigator.pop(context, wasSaved);
            },
            icon: PPIcon(PhosphorIconsFill.floppyDiskBack, context),
            label: Text(
              AppLocalizations.of(context)!.saveCheckIn,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      );
    },
  ) ?? false;

  return accepted;
}

/// Build section header
Widget _buildSectionHeader(BuildContext context, String title) {
  return Padding(
    padding: EdgeInsets.only(
      top: TraleTheme.of(context)!.padding,
      bottom: 0.5 * TraleTheme.of(context)!.padding,
    ),
    child: Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

/// Build numeric input field
Widget _buildNumericInput({
  required BuildContext context,
  required String label,
  required double? value,
  required IconData icon,
  String? suffix,
  required void Function(double?) onChanged,
}) {
  final TextEditingController controller = TextEditingController(
    text: value?.toString() ?? '',
  );

  return GroupedListTile(
    color: Theme.of(context).colorScheme.surfaceContainerLow,
    leading: PPIcon(icon, context),
    title: Text(label),
    trailing: SizedBox(
      width: 100,
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          hintText: '0',
          suffixText: suffix,
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (text) {
          if (text.isEmpty) {
            onChanged(null);
          } else {
            final parsed = double.tryParse(text);
            onChanged(parsed);
          }
        },
      ),
    ),
  );
}

/// Build photos section
Widget _buildPhotosSection({
  required BuildContext context,
  required List<String> photosPaths,
  required void Function(String path) onPhotoAdded,
  required void Function(int index) onPhotoRemoved,
}) {
  final bool canAddMore = photosPaths.length < 3;

  return GroupedListTile(
    color: Theme.of(context).colorScheme.surfaceContainerLow,
    leading: PPIcon(PhosphorIconsDuotone.camera, context),
    title: Text(AppLocalizations.of(context)!.photosSection),
    subtitle: Text(
      '${photosPaths.length}/3',
      style: Theme.of(context).textTheme.bodySmall,
    ),
    trailing: canAddMore
        ? IconButton(
            icon: PPIcon(PhosphorIconsRegular.plus, context),
            onPressed: () => _takePhoto(context, onPhotoAdded),
          )
        : null,
  );
}

/// Take a photo using camera
Future<void> _takePhoto(BuildContext context, void Function(String path) onPhotoAdded) async {
  final ImagePicker picker = ImagePicker();
  
  try {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1920,
      maxHeight: 1920,
      imageQuality: 85,
    );

    if (image != null) {
      // Save photo and strip EXIF
      final savedPath = await DailyCheckInDatabase.savePhoto(
        File(image.path),
        DateTime.now(),
      );
      onPhotoAdded(savedPath);
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to take photo: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

/// Build thoughts section
Widget _buildThoughtsSection({
  required BuildContext context,
  required String thoughts,
  required void Function(String) onChanged,
}) {
  return Padding(
    padding: EdgeInsets.all(TraleTheme.of(context)!.padding),
    child: TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.thoughtsPlaceholder,
        border: InputBorder.none,
      ),
      controller: TextEditingController(text: thoughts),
      onChanged: onChanged,
    ),
  );
}

/// Build workout section
Widget _buildWorkoutSection({
  required BuildContext context,
  required List<WorkoutEntry> workouts,
  required List<String> workoutTypes,
  required int? workoutDurationMinutes,
  required void Function(WorkoutEntry) onWorkoutAdded,
  required void Function(int index) onWorkoutRemoved,
  required void Function(int?) onDurationChanged,
}) {
  return Column(
    children: <Widget>[
      // Add workout button
      Padding(
        padding: EdgeInsets.all(TraleTheme.of(context)!.padding),
        child: OutlinedButton.icon(
          onPressed: () => _showAddWorkoutDialog(context, workoutTypes, onWorkoutAdded),
          icon: PPIcon(PhosphorIconsRegular.plus, context),
          label: Text(AppLocalizations.of(context)!.addWorkout),
        ),
      ),
      // Workout list
      if (workouts.isNotEmpty) ...[
        // Table header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: TraleTheme.of(context)!.padding),
          child: Row(
            children: <Widget>[
              Expanded(flex: 2, child: Text(AppLocalizations.of(context)!.workoutType, style: const TextStyle(fontWeight: FontWeight.bold))),
              Expanded(child: Text(AppLocalizations.of(context)!.setMeasure, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
              Expanded(child: Text(AppLocalizations.of(context)!.reps, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
              Expanded(child: Text(AppLocalizations.of(context)!.sets, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
              Expanded(child: Text(AppLocalizations.of(context)!.indoorOutdoor, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
              const SizedBox(width: 40), // For delete button
            ],
          ),
        ),
        // Workout entries
        ...workouts.asMap().entries.map((entry) {
          final index = entry.key;
          final workout = entry.value;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: TraleTheme.of(context)!.padding,
              vertical: 4,
            ),
            child: Row(
              children: <Widget>[
                Expanded(flex: 2, child: Text(workout.type, overflow: TextOverflow.ellipsis)),
                Expanded(child: Text(workout.setMeasure, textAlign: TextAlign.center)),
                Expanded(child: Text('${workout.reps}', textAlign: TextAlign.center)),
                Expanded(child: Text('${workout.sets}', textAlign: TextAlign.center)),
                Expanded(
                  child: Text(
                    workout.isOutdoor
                        ? AppLocalizations.of(context)!.outdoor
                        : AppLocalizations.of(context)!.indoor,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: workout.isOutdoor ? Colors.green : Colors.blue,
                    ),
                  ),
                ),
                IconButton(
                  icon: PPIcon(PhosphorIconsRegular.trash, context),
                  iconSize: 18,
                  onPressed: () => onWorkoutRemoved(index),
                ),
              ],
            ),
          );
        }),
      ],
      // Duration
      Padding(
        padding: EdgeInsets.all(TraleTheme.of(context)!.padding),
        child: Row(
          children: <Widget>[
            Text(AppLocalizations.of(context)!.workoutDuration),
            const Spacer(),
            SizedBox(
              width: 80,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: '0',
                  suffixText: AppLocalizations.of(context)!.minutes,
                  border: InputBorder.none,
                  isDense: true,
                ),
                controller: TextEditingController(
                  text: workoutDurationMinutes?.toString() ?? '',
                ),
                onChanged: (text) {
                  if (text.isEmpty) {
                    onDurationChanged(null);
                  } else {
                    onDurationChanged(int.tryParse(text));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

/// Show add workout dialog
Future<void> _showAddWorkoutDialog(
  BuildContext context,
  List<String> workoutTypes,
  void Function(WorkoutEntry) onWorkoutAdded,
) async {
  String selectedType = workoutTypes.first;
  String setMeasure = 'kg';
  int reps = 10;
  int sets = 3;
  bool isOutdoor = false;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.addWorkout),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Workout type dropdown
                  DropdownButtonFormField<String>(
                    value: selectedType,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.workoutType,
                    ),
                    items: workoutTypes.map((type) {
                      return DropdownMenuItem(value: type, child: Text(type));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Set measure
                  TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.setMeasure,
                    ),
                    controller: TextEditingController(text: setMeasure),
                    onChanged: (value) {
                      setMeasure = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Reps
                  TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.reps,
                    ),
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(text: reps.toString()),
                    onChanged: (value) {
                      reps = int.tryParse(value) ?? 10;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Sets
                  TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.sets,
                    ),
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(text: sets.toString()),
                    onChanged: (value) {
                      sets = int.tryParse(value) ?? 3;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Indoor/Outdoor toggle
                  SwitchListTile(
                    title: Text(isOutdoor
                        ? AppLocalizations.of(context)!.outdoor
                        : AppLocalizations.of(context)!.indoor),
                    value: isOutdoor,
                    onChanged: (value) {
                      setState(() {
                        isOutdoor = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.abort),
              ),
              FilledButton(
                onPressed: () {
                  onWorkoutAdded(WorkoutEntry(
                    type: selectedType,
                    setMeasure: setMeasure,
                    reps: reps,
                    sets: sets,
                    isOutdoor: isOutdoor,
                  ));
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ],
          );
        },
      );
    },
  );
}