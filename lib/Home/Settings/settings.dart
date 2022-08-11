import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Settings/ThemeBottom.dart';
import 'package:islami/Home/Settings/language_bottom.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SettingsTap extends StatefulWidget {
  static const String routeName = 'Setting';

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackGround()),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.setting_title),
          ),
          body: (Column(
            children: [
              Lottie.asset('assets/lottie/setting.json', width: 300),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Theme.of(context).primaryColor)),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.language,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                        child: InkWell(
                          onTap: () {
                            showLanguageBottomShet();
                          },
                          child: Center(
                              child: settingsProvider.currentLang == 'ar'
                                  ? Text(
                                      'العربية',
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    )
                                  : Text(
                                      'English',
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        AppLocalizations.of(context)!.theme,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                        child: InkWell(
                          onTap: showThemeBottomShet,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            height: 50,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 80),
                            child: Center(
                                child: settingsProvider.isDarkMode()
                                    ? Text(
                                        AppLocalizations.of(context)!.dark,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      )
                                    : Text(
                                        AppLocalizations.of(context)!.light,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.about,
                          style: Theme.of(context).textTheme.headline1,
                        )),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          )),
        ));
  }

  void showLanguageBottomShet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        elevation: 0,
        builder: (
          buildContext,
        ) {
          return LanguageBottom();
        });
  }

  void showThemeBottomShet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        elevation: 0,
        builder: (
          buildContext,
        ) {
          return ThemeBottom();
        });
  }
}
