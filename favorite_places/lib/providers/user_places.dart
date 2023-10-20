import 'dart:io';

import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  //tạo hàm tạo không nhận tham số: danh sách trình khởi tạo
  UserPlacesNotifier() : super([]);
  void addPlace(String title, File image,PlaceLocation location) {
    final newPlace = Place(title: title, image: image,location: location);
    //tạo danh sách trạng thái mới và thêm new Place vào vào danh sách khởi tạo ban đầu
    state = [...state, newPlace];
  }
}

// phương thức cập nhật lại trạng thái
final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
