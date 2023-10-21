import 'dart:io';

import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  //tạo hàm tạo không nhận tham số: danh sách trình khởi tạo
  UserPlacesNotifier() : super([]);
  void addPlace(String title, File image, PlaceLocation location) async {
    final addDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${addDir.path}/$filename');

    final newPlace = Place(title: title, image: copiedImage, location: location);
    //tạo danh sách trạng thái mới và thêm new Place vào vào danh sách khởi tạo ban đầu
    state = [...state, newPlace];
  }
}

// phương thức cập nhật lại trạng thái
final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
