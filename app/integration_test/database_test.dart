import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:trale/database/app_database.dart';
import 'package:drift/drift.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('Database CRUD operations', (tester) async {
    final db = AppDatabase();
    
    final checkInId = await db.insertCheckIn(CheckInsCompanion(
      date: Value(DateTime.now()),
      weight: Value(70.5),
      height: Value(175.0),
      thoughts: Value('Test thoughts'),
    ));
    expect(checkInId, greaterThan(0));
    
    final checkIns = await db.getAllCheckIns();
    expect(checkIns.length, 1);
    expect(checkIns.first.weight, 70.5);
    
    final photoId = await db.insertPhoto(CheckInPhotosCompanion(
      checkInId: Value(checkInId),
      photoPath: Value('/test/path.jpg'),
      capturedAt: Value(DateTime.now()),
    ));
    expect(photoId, greaterThan(0));
    
    final photos = await db.getPhotosByCheckInId(checkInId);
    expect(photos.length, 1);
    expect(photos.first.nsfw, true);
    
    final tagId = await db.insertTag(WorkoutTagsCompanion(name: Value('cardio')));
    await db.linkTagToCheckIn(checkInId, tagId);
    
    final tags = await db.getTagsForCheckIn(checkInId);
    expect(tags.length, 1);
    expect(tags.first.name, 'cardio');
    
    await db.deleteCheckIn(checkInId);
    final photosAfterDelete = await db.getPhotosByCheckInId(checkInId);
    expect(photosAfterDelete.length, 0);
    
    await db.close();
  });
}