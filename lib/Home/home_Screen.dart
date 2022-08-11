import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeth/HadethTab.dart';
import 'package:islami/Home/Quran/QuranTab.dart';
import 'package:islami/Home/Radio/RadioTab.dart';
import 'package:islami/Home/Sebha/SebhaTab.dart';
import 'package:islami/Home/Settings/settings.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    List<String> title = [
      AppLocalizations.of(context)!.quran_title,
      AppLocalizations.of(context)!.hadeth_title,
      AppLocalizations.of(context)!.tasbeh_title,
      AppLocalizations.of(context)!.radio_title
    ];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackGround()),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(title[selectedTabIndex]), actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, SettingsTap.routeName);
              },
              child: Lottie.asset('assets/lottie/settings.json')),
          // IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, SettingsTap.routeName);
          //     },
          //     icon: const Icon(
          //       Icons.settings,
          //       color: Colors.black,
          //     ))
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (index) {
            selectedTabIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_quran.png'),
                ),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon: const ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png')),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon:
                    const ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                label: AppLocalizations.of(context)!.tasbeh),
            BottomNavigationBarItem(
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                icon:
                    const ImageIcon(AssetImage('assets/images/icon_radio.png')),
                label: AppLocalizations.of(context)!.radio),
          ],
        ),
        body: tabs[selectedTabIndex],
      ),
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(), RadioTab()];
}
