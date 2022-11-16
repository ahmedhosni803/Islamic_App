import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeth/Hadeth.dart';
import 'package:islami/Home/Quran/sura_details_display.dart';
import 'package:islami/Home/Sebha/Sebha_.dart';
import 'package:islami/Home/Settings/about.dart';
import 'package:islami/Home/Settings/settings.dart';
import 'package:islami/Home/azkar/azkar_masa.dart';
import 'package:islami/Home/azkar/azkar_weackup.dart';
import 'package:islami/Home/home_Screen.dart';
import 'package:islami/Home/prayer/qubla/Qubla.dart';
import 'package:islami/My_Theme.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/azkar/azkar_sabah.dart';
import 'Home/azkar/azkar_sala.dart';

void main() async {
  runApp(ChangeNotifierProvider<SettingsProvider>(
      create: (buildContext) {
        return SettingsProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingsProvider;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    settingsProvider.Verses();
    getsShared();
    return MaterialApp(
      themeMode: settingsProvider.currentTheme,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Sura.routeName: (_) => Sura(),
        Hadeth.routeName: (_) => Hadeth(),
        SettingsTap.routeName: (_) => SettingsTap(),
        AzkarSabah.routeName: (_) => AzkarSabah(),
        AzkarMasa.routeName: (_) => AzkarMasa(),
        AzkarSalah.routeName: (_) => AzkarSalah(),
        QiblahCompass.routeName: (_) => QiblahCompass(),
        infintySebha.routeName: (_) => infintySebha(),
        Azkarweak.routeName: (_) => Azkarweak(),
        about.routeName: (_) => about(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.currentLang),
    );
  }

  void getsShared() async {
    final prefs = await SharedPreferences.getInstance();

    //set language
    settingsProvider.changeLanguage(prefs.getString('lang') ?? 'ar');
//set Theme
    if (prefs.getString('theme') == 'light') {
      settingsProvider.changeTheme(ThemeMode.light);
    } else if (prefs.getString('theme') == 'dark') {
      settingsProvider.changeTheme(ThemeMode.dark);
    }
  }
}
