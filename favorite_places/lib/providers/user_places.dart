import 'dart:io';

import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();

  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places (id text primary key, title text,image text,lat real,lng real,address text)');
    },
    version: 1,
  );
  return db;
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  //tạo hàm tạo không nhận tham số: danh sách trình khởi tạo
  UserPlacesNotifier() : super([]);
  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data
        .map(
          (e) => Place(
            id: e['id'] as String,
            title: e['title'] as String,
            image: File(e['image'] as String),
            location: PlaceLocation(
              latitude: e['lat'] as double,
              longitude: e['lng'] as double,
              address: e['address'] as String,
            ),
          ),
        )
        .toList();
    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    final addDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${addDir.path}/$filename');

    final newPlace =
        Place(title: title, image: copiedImage, location: location);
    final db = await _getDatabase();
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });

    //tạo danh sách trạng thái mới và thêm new Place vào vào danh sách khởi tạo ban đầu
    state = [...state, newPlace];
  }
}

// phương thức cập nhật lại trạng thái
final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
