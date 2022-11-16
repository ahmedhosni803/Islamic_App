import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class infintySebha extends StatefulWidget {
  static const String routeName = 'infinty';

  @override
  State<infintySebha> createState() => _infintySebhaState();
}

class _infintySebhaState extends State<infintySebha> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackGround()),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('سبحة لا نهائية'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            SizedBox(
              height: 100,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '$index',
              style:
                  Theme.of(context).textTheme.headline4!.copyWith(fontSize: 50),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(color: Colors.deepOrange)),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  index++;
                  setState(() {});
                },
                child: Center(
                    child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    'تسبيح',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
