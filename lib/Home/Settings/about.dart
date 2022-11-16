import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class about extends StatelessWidget {
  static const String routeName = 'about';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.getMainBackGround()), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.about),
        ),
        body: Column(
          children: [
            Row(),
            Card(
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Text(
                      ' اسلامي هو تطبيق يحتوي علي المصحف الكامل بشكل يسهل الحفظ  \n ويحتوي علي ما يقرب من 50 حديث صحيح \n يحتوي علي الاذكار ',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(height: 2),
                      textAlign: TextAlign.center),
                  Text('* اذكار الصباح',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(height: 2),
                      textAlign: TextAlign.center),
                  Text('* اذكار المساء',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(height: 2),
                      textAlign: TextAlign.center),
                  Text('* اذكار بعد الصلاه',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(height: 2),
                      textAlign: TextAlign.center),
                  Text(
                    '* اذكار الاستيقاظ',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(height: 2),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'يحتوي علي قبله و مواقيت الصلاه \nحسب الموقع الخاص بك',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(height: 2),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'يحتوي علي سبحه بها تتغير مع العدد 33 و ايضا يحتوي علي سبحة لانهائية',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(height: 2),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'التطبيق مجاني ولا يحتوي علي اعلانات دائما و ابدا',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(height: 2),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Spacer(),
            Image.asset(
              provider.Bunary_Logo(),
              width: 250,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
