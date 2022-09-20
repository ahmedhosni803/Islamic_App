import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeth/HadethTab.dart';
import 'package:islami/Home/Home.dart';
import 'package:islami/Home/Quran/QuranTab.dart';
import 'package:islami/Home/Sebha/SebhaTab.dart';
import 'package:islami/Home/Settings/settings.dart';
import 'package:islami/Home/prayer/Prayer_Timings.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    List<String> title = [
      AppLocalizations.of(context)!.quran_title,
      AppLocalizations.of(context)!.hadeth_title,
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.tasbeh_title,
      AppLocalizations.of(context)!.prayer_title
    ];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackGround()),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(title[selectedTabIndex]), actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, SettingsTap.routeName);
              },
              child: Lottie.asset('assets/lottie/settings.zip')),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2),
              borderRadius: BorderRadius.circular(50)),
          width: 75,
          height: 75,
          child: FloatingActionButton(
              shape: StadiumBorder(
                  side: BorderSide(
                      width: 8, color: Theme.of(context).backgroundColor)),
              splashColor: Theme.of(context).primaryColor,
              hoverColor: Theme.of(context).primaryColor,
              onPressed: () {
                selectedTabIndex = 2;
                setState(() {});
              },
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 5,
              child: Image.asset(
                'assets/images/home.png',
                height: 50,
              )),
        ),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 8,
            color: Theme.of(context).backgroundColor,
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).backgroundColor,
              showUnselectedLabels: false,
              currentIndex: selectedTabIndex,
              onTap: (index) {
                selectedTabIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    icon: (Image.asset(
                      'assets/images/quran.png',
                      width: 40,
                    )),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    icon: (Image.asset(
                      'assets/images/hadeth.png',
                      width: 40,
                    )),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    icon: const Icon(
                      (Icons.home),
                      size: 0,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    icon: (Image.asset(
                      'assets/images/tasbih.png',
                      width: 40,
                    )),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    icon: (Image.asset(
                      'assets/images/prayer.png',
                      width: 40,
                    )),
                    label: AppLocalizations.of(context)!.prayer),
              ],
            )),
        body: tabs[selectedTabIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    Home(),
    SebhaTab(),
    PrayerTab()
  ];
}
