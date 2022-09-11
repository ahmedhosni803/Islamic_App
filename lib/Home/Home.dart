import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    int index = (Random().nextInt(100));
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<SettingsProvider>(context);
    provider.ReadFile(index);
    provider.Verses();
    return provider.verses.isEmpty
        ? Center(
            child: Lottie.asset('assets/lottie/loading.zip',
                width: size.width * 0.6),
          )
        : Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Lottie.asset('assets/lottie/quran.zip',
                    width: size.width * 0.4),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: size.height * 0.18,
                              padding: const EdgeInsetsDirectional.all(10),
                              margin: const EdgeInsets.only(
                                  top: 30, left: 5, right: 5, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: SingleChildScrollView(
                                child: Center(
                                  child: Text(
                                    provider.ver,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(fontSize: size.width * 0.045),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                splashColor: Theme.of(context).primaryColor,
                                highlightColor: Theme.of(context).primaryColor,
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: provider.ver));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
                                      borderRadius: BorderRadius.circular(15),
                                      color: Theme.of(context).backgroundColor),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/icon/copy.png'),
                                          width: 35,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'نسخ الاية',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: size.width * 0.045),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // تغيير الايه القرأنية
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                splashColor: Theme.of(context).primaryColor,
                                highlightColor: Theme.of(context).primaryColor,
                                onTap: () {
                                  setState(() {
                                    provider.New();
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
                                      borderRadius: BorderRadius.circular(15),
                                      color: Theme.of(context).backgroundColor),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/icon/change.png'),
                                          width: 35,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'تغيير الاية القرأنية',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: size.width * 0.040),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.22,
                            child: ListView(
                              physics: AlwaysScrollableScrollPhysics(),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ScrolingInHome('أذكار الصباج', size,
                                        image: 'light.png'),
                                    ScrolingInHome('أذكار المساء', size,
                                        image: 'night.png'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ScrolingInHome('أذكار قبل النوم', size,
                                        image: 'sallah.png'),
                                    ScrolingInHome('أذكار بعد الصلاه', size,
                                        image: 'sleep.png'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  ScrolingInHome(String text, Size size, {String? image = 'sallah.png'}) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).primaryColor),
            color: Theme.of(context).backgroundColor),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/icon/$image'),
                  width: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: size.width * 0.04),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
