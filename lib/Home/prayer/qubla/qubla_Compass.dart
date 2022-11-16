import 'dart:async';
import 'dart:math' show pi;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import 'location_error.dart';

class QiblaCompass extends StatefulWidget {
  @override
  _QiblaCompassState createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: stream,
                builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CupertinoActivityIndicator();
                  if (snapshot.data?.enabled == true) {
                    switch (snapshot.data?.status) {
                      case LocationPermission.always:
                      case LocationPermission.whileInUse:
                        return Expanded(child: QiblahCompassWidget());

                      case LocationPermission.denied:
                        return LocationErrorWidget(
                          error: "Location service permission denied",
                          callback: _checkLocationStatus,
                        );
                      case LocationPermission.deniedForever:
                        return LocationErrorWidget(
                          error: "Location service Denied Forever !",
                          callback: _checkLocationStatus,
                        );
                      // case GeolocationStatus.unknown:
                      //   return LocationErrorWidget(
                      //     error: "Unknown Location service error",
                      //     callback: _checkLocationStatus,
                      //   );
                      default:
                        return Container();
                    }
                  } else {
                    return LocationErrorWidget(
                      error: "Please enable Location service",
                      callback: _checkLocationStatus,
                    );
                  }
                },
              ),
            ),
          ]),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _kaabaSvg = SvgPicture.asset('assets/4.svg');

  @override
  Widget build(BuildContext context) {
    var _platformBrightness = Theme.of(context).brightness;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FlutterQiblah.qiblahStream,
              builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return CupertinoActivityIndicator();

                final qiblahDirection = snapshot.data;
                var _angle = ((qiblahDirection?.qiblah ?? 0) * (pi / 180) * -1);

                // if (_angle < 5 && _angle > -5) print('IN RANGE');

                return Scaffold(
                  body: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "اجعل السهمين في تاجه بعضهم البعض",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Transform.rotate(
                            angle: _angle,
                            child: SvgPicture.asset('assets/5.svg', // compass
                                color: _platformBrightness == Brightness.dark
                                    ? Colors.yellow
                                    : Colors.orange),
                          ),
                          _kaabaSvg,
                          SvgPicture.asset('assets/3.svg', //needle
                              color: _platformBrightness == Brightness.dark
                                  ? Colors.yellow
                                  : Colors.orange),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
