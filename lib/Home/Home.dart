import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    int index = Random().nextInt(113);
    if (index <= 0) {
      index = index * -1;
    }
    final _random = Random();
    if (Provider.of<SettingsProvider>(context, listen: false).verses.isEmpty)
      Provider.of<SettingsProvider>(context).ReadFile(index + 1);
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Lottie.asset('assets/lottie/quran.zip'),
              Container(
                  padding: const EdgeInsetsDirectional.all(20),
                  margin: const EdgeInsets.only(
                      top: 25, left: 5, right: 5, bottom: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      Provider.of<SettingsProvider>(context, listen: false)
                              .verses[
                          _random.nextInt(Provider.of<SettingsProvider>(context)
                              .verses
                              .length)],
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

// void ReadFile(int index) async {
//   String content =
//       await rootBundle.loadString('assets/Quran/${index + 1}.txt');
//   List<String> line = content.trim().split("\n");
//   verses = line;
//   setState(() {});
// }
}
