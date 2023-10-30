import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/utils/constants.dart';

class StorageService {
  late final SharedPreferences _pref;

  /// Tải và phân tích [SharedPreferences] cho ứng dụng này từ đĩa.
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }
  /// xem thiết bị có được cài đặt lần đầu tiên hay không
  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }
}
