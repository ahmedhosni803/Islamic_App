import 'package:flutter/material.dart';
import 'package:islami/Home/azkar/zekrWidget.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class AzkarSalah extends StatefulWidget {
  static const String routeName = 'salah';

  @override
  State<AzkarSalah> createState() => _AzkarSalahState();
}

class _AzkarSalahState extends State<AzkarSalah> {
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
          title: Text('أذكار بعد الصلاة'),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            ZekrWidget(
              1,
              'أَسْـتَغْفِرُ الله، أَسْـتَغْفِرُ الله، أَسْـتَغْفِرُ الله.\n'
              'اللّهُـمَّ أَنْـتَ السَّلامُ ، وَمِـنْكَ السَّلام ، تَبارَكْتَ يا ذا الجَـلالِ وَالإِكْـرام .ُ',
            ),
            ZekrWidget(1,
                'لا إلهَ إلاّ اللّهُ وحدَهُ لا شريكَ لهُ، لهُ المُـلْكُ ولهُ الحَمْد، وهوَ على كلّ شَيءٍ قَدير، اللّهُـمَّ لا مانِعَ لِما أَعْطَـيْت، وَلا مُعْطِـيَ لِما مَنَـعْت، وَلا يَنْفَـعُ ذا الجَـدِّ مِنْـكَ الجَـد. '),
            ZekrWidget(1,
                'لا إلهَ إلاّ اللّه, وحدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمد، وهوَ على كلّ شيءٍ قدير، لا حَـوْلَ وَلا قـوَّةَ إِلاّ بِاللهِ، لا إلهَ إلاّ اللّـه، وَلا نَعْـبُـدُ إِلاّ إيّـاه, لَهُ النِّعْـمَةُ وَلَهُ الفَضْل وَلَهُ الثَّـناءُ الحَـسَن، لا إلهَ إلاّ اللّهُ مخْلِصـينَ لَـهُ الدِّينَ وَلَوْ كَـرِهَ الكـافِرون. '),
            ZekrWidget(
                33, 'سُـبْحانَ اللهِ، والحَمْـدُ لله ، واللهُ أكْـبَر. '),
            ZekrWidget(1,
                'لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمْد، وهُوَ على كُلّ شَيءٍ قَـدير.'),
            ZekrWidget(
              3,
              'بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم \n قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ'
              ' وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ.'
              'بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم \n قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ'
              ' غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ. '
              'بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم \n قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ'
              ' ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.',
              widge: card(
                  'ثلاث مرات بعد صلاتي  والمغرب. ومرة بعد الصلوات الأخرى.'),
            ),
            ZekrWidget(
                1,
                'أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\n'
                'اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ. '),
            ZekrWidget(10,
                'لا إلهَ إلاّ اللّهُ وحْـدَهُ لا شريكَ لهُ، لهُ المُلكُ ولهُ الحَمْد، يُحيـي وَيُمـيتُ وهُوَ على كُلّ شيءٍ قدير.',
                widge: card('عَشْر مَرّات بَعْدَ المَغْرِب وَالصّـبْح.')),
            ZekrWidget(
              1,
              'اللّهُـمَّ إِنِّـي أَسْأَلُـكَ عِلْمـاً نافِعـاً وَرِزْقـاً طَيِّـباً ، وَعَمَـلاً مُتَقَـبَّلاً. ',
              widge: card('بَعْد السّلامِ من صَلاةِ الفَجْر.'),
            ),
            ZekrWidget(7, 'اللَّهُمَّ أَجِرْنِي مِنْ النَّار.',
                widge: card('بعد صلاة الصبح والمغرب.')),
            ZekrWidget(1,
                'اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ.'),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  card(String text) {
    return Card(
        elevation: 10,
        color: Theme.of(context).backgroundColor,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              text,
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
              textAlign: TextAlign.center,
            )));
  }

// zekr(String zekr, int index,) {
//   return Card(
//     color: Theme.of(context).backgroundColor,
//     elevation: 10,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Text(
//           '$index',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         index!=0?Card(
//           elevation: 10,
//           color: Theme.of(context).backgroundColor,
//           child: Container(
//             padding: EdgeInsets.all(10),
//             color: Colors.transparent,
//             width: MediaQuery.of(context).size.width * 0.8,
//             child: Text(
//               zekr,
//               style: Theme.of(context)
//                   .textTheme
//                   .headline1!
//                   .copyWith(height: 1.8),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ):Card(
//   color: Color.fromRGBO(126, 58, 58, 1.0),
//   child: Container(
//   padding: EdgeInsets.all(10),
//   color: Colors.transparent,
//   width: MediaQuery.of(context).size.width * 0.8,
//   child: Text(
//   zekr,
//   style: Theme.of(context)
//       .textTheme
//       .headline1!
//       .copyWith(height: 1.8),
//   textAlign: TextAlign.center,
//   ),
//   ),
//   )
//       ],
//     ),
//   );
// }
}
