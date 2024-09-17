import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {

// Salvar um map de dados como String no SharedPreferences
  static Future<void> saveMap(String key, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }


//Recuperar um map de dados do SharedPreferences
  static Future<Map<String, dynamic>?> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) {
      return {};
    }
    return Map<String, dynamic>.from(jsonDecode(jsonString));
  }


//Remover um map de dados do SharedPreferences
  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }





}
