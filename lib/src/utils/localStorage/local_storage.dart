import 'package:localstorage/localstorage.dart';

class LocalStorageKeys {
  static const String languageCode = 'languageCode';
  static const String theme = 'theme';
  static const String refreshToken = 'refreshToken';
  static const String accessToken = 'accessToken';
}

class LocalStorageAdapter {
  final LocalStorage _storage = LocalStorage('easy_doctor_storage');

  Future<void> setData(String key, String data) async {
    await _storage.ready;

    _storage.setItem(key, data);
  }

  Future<String> getData(String key) async {
    await _storage.ready;

    return _storage.getItem(key).toString();
  }
}

class LocalStorageRepository {
  LocalStorageRepository();

  final LocalStorageAdapter localStorageAdapter = LocalStorageAdapter();

  ///set & get REFRESH TOKEN
  void setRefreshToken(String jwt) {
    localStorageAdapter.setData(LocalStorageKeys.refreshToken, jwt);
  }

  Future<String> getRefreshToken() async {
    return await localStorageAdapter.getData(LocalStorageKeys.refreshToken);
  }
}
