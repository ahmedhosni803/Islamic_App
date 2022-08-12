import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int tap = 0;
  int caonter = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .4,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(settingsProvider.getMainSebha_head()),
                      top: 15,
                      left: size.width * .48,
                    ),
                    Positioned(
                      child: InkWell(
                          onTap: onPressd,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Transform.rotate(
                              angle: angle,
                              child: Image.asset(
                                  settingsProvider.getMainSebha()))),
                      top: 85,
                      left: size.width * .21,
                      right: size.width * .21,
                    ),
                  ],
                ),
              ),
              Text(
                AppLocalizations.of(context)!.numbertasbeh,
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.deepOrange)),
                height: 80,
                width: 70,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                child: Center(
                    child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 6),
                        child: Text(
                          '$tap',
                          style: Theme.of(context).textTheme.headline4,
                        ))),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 180,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.deepOrange)),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                child: InkWell(
                  onTap: onPressd,
                  child: Center(
                      child: Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Text(
                            azkar[caonter],
                            style: Theme.of(context).textTheme.headline1,
                          ))),
                ),
              )
            ],
          ),
        ));
  }

  onPressd() {
    angle--;
    tap++;
    if (tap == 34) {
      tap = 0;
      caonter++;
    }
    if (caonter == azkar.length) {
      caonter = 0;
    }
    setState(() {});
  }
}
