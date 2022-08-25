import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late var index = 1;
  late final _random;

  @override
  void initState() {
    _random = Random();
    index = (Random(25).nextInt(100) + 1).toInt();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    if (Provider.of<SettingsProvider>(context, listen: false).verses.isEmpty)
      Provider.of<SettingsProvider>(context).ReadFile(index + 1);
    return Provider.of<SettingsProvider>(context).verses.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Container(
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
                      Provider.of<SettingsProvider>(context,
                                        listen: false)
                                    .verses[
                                _random.nextInt(
                                    Provider.of<SettingsProvider>(context)
                                        .verses
                                        .length
                                        .toInt())],
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
}
