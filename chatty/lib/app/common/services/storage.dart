import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  /// xác định lớp
  static StorageService get to => Get.find();

  /// tạo không gian bộ nhớ
  late final SharedPreferences _prefs;

  /// tạo ra một đối tượng ưu tiên để chia sẽ
  Future<StorageService> init() async {
    // lưu giữ tất cả các tham chiếu cần lưu trữ
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // lưu dữ liệu dưới dạng chuổi
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  // lưu dữ liệu dưới dạng true false
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  // lưu dữ liệu dưới dạng danh sách chuổi
  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  // lấy dữ liệu dạng chuổi
  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  // lấy dữ liệu dạng true false
  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  // lấy dữ liệu dạng danh sách chuổi
  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  // xóa dữ liệu
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
