import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:youthetree/logger/logger.dart';

class LocalStorageService {
  final _storage = FlutterSecureStorage();

  LocalStorageService() {
    //deleteValue(LocalStorageKeys.bearer);
  }

  Future<String> readString(String key) async {
    var read = await _storage.read(key: key);
    l.info("read $key $read");

    return read;
  }

  Future<void> deleteValue(String key) {
    l.info("delete $key ");

    return _storage.delete(key: key);
  }

  Future<void> addString(String key, String value) {
    l.info("add $key $value");
    return _storage.write(key: key, value: value);
  }

  Future<dynamic> readJSON(String key) async {
    var read = await _storage.read(key: key);
    l.info("read JSON $key $read");

    if (read == null) {
      return null;
    }
    return json.decode(read);
  }

  Future<void> addJSON(String key, dynamic value) {
    l.info("add JSON $key $value");
    if (value == null) {
      _storage.write(key: key, value: null);
    }
    return _storage.write(key: key, value: jsonEncode(value));
  }
}

class LocalStorageKeys {
  static const String firstTime = 'firstTime';
}
