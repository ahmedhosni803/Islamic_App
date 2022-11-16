import 'package:flutter/material.dart';
import 'package:islami/Home/azkar/zekrWidget.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class Azkarweak extends StatelessWidget {
  static const String routeName = 'weak';
  List<Widget> Zekr = [
    ZekrWidget(1,
        'الحَمْـدُ لِلّهِ الّذي أَحْـيانا بَعْـدَ ما أَماتَـنا وَإليه النُّـشور. '),
    ZekrWidget(1,
        'الحمدُ للهِ الذي عافاني في جَسَدي وَرَدّ عَليّ روحي وَأَذِنَ لي بِذِكْرِه. '),
    ZekrWidget(1,
        'لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شَـريكَ له، لهُ المُلـكُ ولهُ الحَمـد، وهوَ على كلّ شيءٍ قدير، سُـبْحانَ اللهِ، والحمْـدُ لله ، ولا إلهَ إلاّ اللهُ واللهُ أكبَر، وَلا حَولَ وَلا قوّة إلاّ باللّهِ العليّ العظيم. رَبِّ اغْفرْ لي.'),
  ];

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('أذكار الاستيقاظ'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 25),
          child: ListView.builder(
              itemCount: Zekr.length,
              itemBuilder: (BuildContext context, int index) {
                return Zekr[index];
              }),
        ),
      ),
    );
  }
}
