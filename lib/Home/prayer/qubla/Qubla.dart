import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:islami/Home/prayer/qubla/qubla_Compass.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class QiblahCompass extends StatefulWidget {
  static const String routeName = 'QiblahCompass';

  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  Provider.of<SettingsProvider>(context).getMainBackGround()),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('اتجاه القبلة'),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _deviceSupport,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );

                  if (snapshot.hasError)
                    return Center(
                      child: Text('Error: ${snapshot.error.toString()}'),
                    );
                  if (snapshot.hasData)
                    return Expanded(child: QiblaCompass());
                  else
                    return Container(
                      child: Text('Error'),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
