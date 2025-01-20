import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  final SharedPreferences pref;

  AppThemeProvider({required this.pref}) {
    initializeTheme();
  }

  ThemeMode themeMode = ThemeMode.light;

  void initializeTheme() {
    final isDarkMode = pref.getBool('darkMode') ?? false;
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify listeners for initial setup.
  }

  void toggleTheme() {
    final isDarkMode = themeMode == ThemeMode.dark;
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    pref.setBool('darkMode', !isDarkMode);
    notifyListeners();
  }
}
