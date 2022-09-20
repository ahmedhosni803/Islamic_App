import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/Quran/QuranSura.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class Sura extends StatefulWidget {
  static const String routeName = 'Sura';

  @override
  State<Sura> createState() => _SuraState();
}

class _SuraState extends State<Sura> {
  // List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraDitails;
    String bsmala = ' ';
    if (args.index != 4) {
      bsmala = 'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم';
    }
    // if (verses.isEmpty) ReadFile(args.index);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackGround()),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text('سورة ${args.title}'),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  bsmala,
                  style: Theme.of(context).textTheme.headline3,
                ),
                // محتويات صفحة الصورة
                FutureBuilder<List<String>>(
                    future: ReadFile('${args.index + 1}.txt'),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Eroor');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      var verses = snapshot.data;
                      return Expanded(
                        child: Container(
                          padding: const EdgeInsetsDirectional.all(15),
                          child: Container(
                            padding: const EdgeInsetsDirectional.all(0),
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: ListView.separated(
                              itemBuilder: (_, index) {
                                return QuranSura(verses![index], index);
                              },
                              itemCount: verses?.length ?? 0,
                              separatorBuilder: (_, index) {
                                return Container(
                                  color: Theme.of(context).primaryColor,
                                  width: double.infinity,
                                  height: 1,
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    })
              ],
            )));
  }

  Future<List<String>> readFile(String fileName) async {
    String content = await rootBundle.loadString('assets/files/$fileName');
    List<String> lines = content.trim().split("\r\n");
    return lines;
  }

  Future<List<String>> ReadFile(String fileName) async {
    String content = await rootBundle.loadString('assets/Quran/$fileName');
    List<String> line = content.trim().split("\n");
    return line;
  }
}

class SuraDitails {
  int index;
  String title;

  SuraDitails(this.index, this.title);
}

// void ReadFile(int index) async {
//   String content =
//   await rootBundle.loadString('assets/Quran/${index + 1}.txt');
//   int num = 0;
//   List<String> line = content.trim().split("\n");
//   verses = line;
//   setState(() {});
// }
