import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _darkModeKey = 'darkMode';
  static const _voiceResponseKey = 'voiceResponse';

  Future<void> setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, value);
  }

  Future<void> setVoiceResponse(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_voiceResponseKey, value);
  }

  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkModeKey) ?? false;
  }

  Future<bool> getVoiceResponse() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_voiceResponseKey) ?? true;
  }
}
