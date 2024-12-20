import 'package:get_storage/get_storage.dart';

class StorageService {
  static Future<void> init() async {
    await GetStorage.init();
  }

  final GetStorage _storage = GetStorage();

////saving data to local storage
  Future<void> saveData({required String key, required dynamic value}) async {
    await _storage.write(key, value);
  }

  ///get data from local storage
  dynamic getData({required String key}) {
    return _storage.read(key);
  }

  //setting user exixtance state

  void setExistence({required bool isUser}) {
    _storage.write("userExist", isUser);
  }

  //getting user exixtance state
  bool getExistence() {
    return _storage.read("userExist") ?? false;
  }
}
