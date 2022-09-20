import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/azkar/azkar_masa.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'ScrolingInHome.dart';
import 'azkar/azkar_sabah.dart';
import 'azkar/azkar_sala.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    Size size = MediaQuery.of(context).size;
    provider.Verses();
    return provider.verses.isEmpty
        ? Center(child: CircularProgressIndicator())
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
                          SizedBox(
                            height: 25,
                          ),
                          Card(
                            color: Colors.transparent,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Container(
                                width: double.infinity,
                                height: size.height * 0.18,
                                padding: const EdgeInsetsDirectional.all(10),
                                margin: const EdgeInsets.only(
                                    top: 2, left: 2, right: 2, bottom: 2),
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
                                          .copyWith(
                                              fontSize: size.width * 0.05),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )),
                          ),
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
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height:
                                        MediaQuery.of(context).size.width * 0.1,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            Theme.of(context).backgroundColor),
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
                                                    fontSize:
                                                        size.width * 0.045),
                                          ),
                                        ],
                                      ),
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
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 12),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            Theme.of(context).backgroundColor),
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
                                                    fontSize:
                                                        size.width * 0.040),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                            child: ListView(
                              physics: AlwaysScrollableScrollPhysics(),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ScrolingInHome(
                                      'أذكار الصباج',
                                      size,
                                      AzkarSabah.routeName,
                                      image: 'light.png',
                                    ),
                                    ScrolingInHome('أذكار المساء', size,
                                        AzkarMasa.routeName,
                                        image: 'night.png'),
                                  ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                                    ScrolingInHome('أذكار بعد الصلاة', size,
                                        AzkarSalah.routeName,
                                        image: 'sallah.png'),
                                    ScrolingInHome('أذكارالاستيقاظ', size,
                                        AzkarSabah.routeName,
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
// ScrolingInHome(String text, Size size, String page,
//     {String? image = 'sallah.png'}) {
//   return InkWell(
//     onTap: () {
//       Navigator.pushNamed(context, page);
//     },
//     child: Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       color: Colors.transparent,
//       elevation: 10,
//       child: Container(
//         height: 80,
//         margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Theme.of(context).primaryColor),
//             color: Theme.of(context).backgroundColor),
//         width: MediaQuery.of(context).size.width * 0.45,
//         child: FittedBox(
//           fit: BoxFit.scaleDown,
//           child: Row(
//             children: [
//               Image(
//                 image: AssetImage('assets/icon/$image'),
//                 width: 40,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 text,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline1!
//                     .copyWith(fontSize: size.width * 0.04),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
}
