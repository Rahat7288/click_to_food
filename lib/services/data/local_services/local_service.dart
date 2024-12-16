import 'package:get_storage/get_storage.dart';

class StorageService {
  static Future<void> init() async {
    await GetStorage.init();
  }
}
