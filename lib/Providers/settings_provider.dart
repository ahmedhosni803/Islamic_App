import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLang = 'ar';
  ThemeMode currentTheme = ThemeMode.dark;
  List<String> verses = [];
  final _random = Random();
  late var ver = verses[_random.nextInt(verses.length)];

  Verses() async {
    String Vers;
    final _random = Random();
    int index = (Random().nextInt(100));
    if (verses.isEmpty) {
      ReadFile(index);
    }
    Vers = await verses[_random.nextInt(verses.length)];
    return Vers;
  }

  New() async {
    int index = (Random().nextInt(100));
    ReadFile(index);
    ver = await verses[_random.nextInt(verses.length)];
  }

  // String Vers = provider.verses[_random.nextInt
  //   (provider.verses.length.toInt())] ;
  //
  // if (provider.verses.isEmpty)
  // provider.ReadFile(index + 1);

  void changeTheme(ThemeMode newTheme) async {
    final prefs = await SharedPreferences.getInstance();

    if (newTheme == currentTheme) {
      return;
    }
    currentTheme = newTheme;
    prefs.setString(
        'theme', currentTheme == ThemeMode.light ? 'light' : 'dark');

    notifyListeners();
  }

  void changeLanguage(String newLang) async {
    final prefs = await SharedPreferences.getInstance();

    if (currentLang == newLang) {
      return;
    }

    currentLang = newLang;
    prefs.setString('lang', currentLang);
    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }

  String getMainBackGround() {
    return isDarkMode()
        ? 'assets/images/main_background_dark.png'
        : 'assets/images/main_background.png';
  }

  String getMainSebha_head() {
    return isDarkMode()
        ? 'assets/images/head_sebha_dark.png'
        : 'assets/images/head_sebha_logo.png';
  }

  String getMainSebha() {
    return isDarkMode()
        ? 'assets/images/body_sebha_dark.png'
        : 'assets/images/body_sebha_logo.png';
  }

  void ReadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/Quran/${index + 1}.txt');
    List<String> line = content.trim().split("\n");
    verses = line;
    notifyListeners();
  }
}
