import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottom extends StatefulWidget {
  @override
  State<ThemeBottom> createState() => _ThemeBottomState();
}

class _ThemeBottomState extends State<ThemeBottom> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        color: Theme.of(context).backgroundColor,
      ),
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        settingsProvider.changeTheme(ThemeMode.light);
                      },
                      child: settingsProvider.isDarkMode()
                          ? getUnSelectedItem(
                              AppLocalizations.of(context)!.light)
                          : getSelectedItem(
                              AppLocalizations.of(context)!.light)),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      onTap: () {
                        settingsProvider.changeTheme(ThemeMode.dark);
                      },
                      child: settingsProvider.isDarkMode()
                          ? getSelectedItem(AppLocalizations.of(context)!.dark)
                          : getUnSelectedItem(
                              AppLocalizations.of(context)!.dark)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.deepOrange)),
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline1,
          ),
          const Icon(Icons.check),
        ],
      ),
    );
  }

  Widget getUnSelectedItem(String text) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Theme.of(context).primaryColor)),
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline1,
          )
        ]));
  }
}
