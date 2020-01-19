import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';


class StorageService {
  SharedPreferences _preferences;
  BehaviorSubject<bool> _ready = BehaviorSubject<bool>.seeded(false);
  
  StorageService();

  init() async {
    final preferencesFuture = SharedPreferences.getInstance();
    _preferences = await preferencesFuture;
    // await _preferences.clear();
    _ready.sink.add(true);
  }

  Stream<bool> get ready => _ready
    .where((ready) => ready == true);

  /// returns [null] if key does not exist
  String getString(String key) =>
    _preferences.containsKey(key) ? _preferences.getString(key) : null;

  Future<bool> setString(String key, String value) =>
    _preferences.setString(key, value);

  /// returns [null] if key does not exist
  Map<String, dynamic> getObject(String key) =>
    _preferences.containsKey(key) ? jsonDecode(_preferences.getString(key)) : null;

  Future<bool> setObject(String key, Object value) =>
    _preferences.setString(key, jsonEncode(value));

  dispose() {
    _ready.close();
  }
}
