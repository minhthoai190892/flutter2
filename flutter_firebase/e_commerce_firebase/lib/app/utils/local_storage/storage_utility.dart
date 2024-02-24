import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  TLocalStorage._internal();
  static final TLocalStorage _instance = TLocalStorage._internal();
  factory TLocalStorage() {
    return _instance;
  }
  final _storage = GetStorage();

  ///Generic methodto save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  ///Generic methodto read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  ///Generic methodto remove data
  Future<void> removeData<T>(String key) async {
    await _storage.remove(key);
  }

  ///Clear all data storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
