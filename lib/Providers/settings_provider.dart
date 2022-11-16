import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLang = 'ar';
  ThemeMode currentTheme = ThemeMode.dark;

  List<String> verses = [];
  Random _random = new Random();
  late var ver = verses[_random.nextInt(verses.length)];

  Future Verses() async {
     _random = new Random();
    if (verses.isEmpty) {
      ReadFile(_random.nextInt(100));
    }
    ver = await verses[_random.nextInt(verses.length) + 1];
    return await verses[_random.nextInt(verses.length) + 1];
  }

  New() async {
    int index = (_random.nextInt(100));
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
        ? 'assets/images/background_dark.jpg'
        : 'assets/images/background.jpg';
  }

  String Bunary_Logo() {
    return isDarkMode() ? 'assets/images/logo2.png' : 'assets/images/logo1.png';
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

  // Future readfile() async {
  //   final ran = Random();
  //   List<String> line = [];
  //   int index = 0;
  //   if (line.isEmpty){index = (Random().nextInt(100));
  //   ;}
  //   String content = await rootBundle.loadString('assets/Quran/${5+1}.txt');
  //   line = content.trim().split("/n");
  //   return line;
  // }

  void ReadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/Quran/${index + 1}.txt');
    List<String> line = content.trim().split("\n");
    verses = line;
    notifyListeners();
  }
}
