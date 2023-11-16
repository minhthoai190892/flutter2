import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/utils/constants.dart';

class StorageService {
  late final SharedPreferences _pref;

  /// Tải và phân tích [SharedPreferences] cho ứng dụng này từ đĩa.
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  /// xem thiết bị có được cài đặt lần đầu tiên hay không
  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }

  String getUserToken() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  String getString(String key) {
    return _pref.getString(key) ?? "";
  }

  /// hàm lấy profile  khi được chuyển đổi
  UserProfile getUserProfile() {
    // lưu vào bộ nhớ
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    //chuyển đổi dữ liệu từ String sang Map
    var profileJson = jsonDecode(profile);
    UserProfile userProfile = UserProfile.fromMap(profileJson);
    print(userProfile);
    return userProfile;
  }
}
