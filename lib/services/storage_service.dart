import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../utils/constants.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  late SharedPreferences _prefs;

  StorageService._internal();

  factory StorageService {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Auth Token Management
  Future<void> saveToken(String token) async {
    await _prefs.setString(AppConstants.keyAuthToken, token);
  }

  Future<String?> getToken() async {
    return _prefs.getString(AppConstants.keyAuthToken);
  }

  Future<void> saveRefreshToken(String token) async {
    await _prefs.setString(AppConstants.keyRefreshToken, token);
  }

  Future<String?> getRefreshToken() async {
    return _prefs.getString(AppConstants.keyRefreshToken);
  }

  // User Data Management
  Future<void> saveUserId(String userId) async {
    await _prefs.setString(AppConstants.keyUserId, userId);
  }

  Future<String?> getUserId() async {
    return _prefs.getString(AppConstants.keyUserId);
  }

  Future<void> saveUserRole(String role) async {
    await _prefs.setString(AppConstants.keyUserRole, role);
  }

  Future<String?> getUserRole() async {
    return _prefs.getString(AppConstants.keyUserRole);
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _prefs.setString(AppConstants.keyUserData, jsonEncode(userData));
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final data = _prefs.getString(AppConstants.keyUserData);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  // Onboarding Status
  Future<void> setOnboardingShown() async {
    await _prefs.setBool(AppConstants.keyOnboardingShown, true);
  }

  Future<bool> isOnboardingShown() async {
    return _prefs.getBool(AppConstants.keyOnboardingShown) ?? false;
  }

  // Theme & Language  
  Future<void> setThemeMode(String mode) async {
    await _prefs.setString(AppConstants.keyThemeMode, mode);
  }

  Future<String?> getThemeMode() async {
    return _prefs.getString(AppConstants.keyThemeMode);
  }

  Future<void> setLanguage(String language) async {
    await _prefs.setString(AppConstants.keyLanguage, language);
  }

  Future<String?> getLanguage() async {
    return _prefs.getString(AppConstants.keyLanguage);
  }

  // Clear All Data
  Future<void> clearAll() async {
    await _prefs.clear();
  }

  Future<void> logout() async {
    await _prefs.remove(AppConstants.keyAuthToken);
    await _prefs.remove(AppConstants.keyRefreshToken);
    await _prefs.remove(AppConstants.keyUserId);
    await _prefs.remove(AppConstants.keyUserRole);
    await _prefs.remove(AppConstants.keyUserData);
  }

  bool hasToken() {
    return _prefs.containsKey(AppConstants.keyAuthToken);
  }
}
    await _prefs.setString('auth_token', token);
  }

  String? getToken() {
    return _prefs.getString('auth_token');
  }

  Future<void> clearToken() async {
    await _prefs.remove('auth_token');
  }

  // User data management
  Future<void> saveUser(Map<String, dynamic> user) async {
    await _prefs.setString('user_data', jsonEncode(user));
  }

  Map<String, dynamic>? getUser() {
    final userData = _prefs.getString('user_data');
    if (userData != null) {
      return jsonDecode(userData);
    }
    return null;
  }

  Future<void> clearUser() async {
    await _prefs.remove('user_data');
  }

  // Cart management
  Future<void> saveCart(List<Map<String, dynamic>> cart) async {
    await _prefs.setString('cart', jsonEncode(cart));
  }

  List<Map<String, dynamic>> getCart() {
    final cart = _prefs.getString('cart');
    if (cart != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(cart));
    }
    return [];
  }

  Future<void> clearCart() async {
    await _prefs.remove('cart');
  }

  // Preferences
  Future<void> setPreference(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getPreference(String key) {
    return _prefs.getString(key);
  }

  Future<void> setBoolPreference(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool? getBoolPreference(String key) {
    return _prefs.getBool(key);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
