import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

class PrayerTab extends StatefulWidget {
  @override
  State<PrayerTab> createState() => _PrayerTabState();
}

Location location = new Location();
late bool _serviceEnabled;
PermissionStatus? _permissionGranted;
LocationData? _locationData;

getLocation() async {
  _serviceEnabled = await location.serviceEnabled();
  // if (!_serviceEnabled) {
  //   _serviceEnabled = await location.requestService();
  // }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
  }
  _locationData = await location.getLocation();
}

late double? long;
late double? lat;

class _PrayerTabState extends State<PrayerTab> {
  @override
  void initState() {
    getLocation();

    super.initState();

    long = (_locationData?.longitude) ?? 30.033333;
    lat = (_locationData?.latitude) ?? 31.233334;
  }

  @override
  Widget build(BuildContext context) {
    if (_locationData == null) {
      // setState(() {getLocation();});
      Timer(Duration(seconds: 1), () {
        setState(() {});
      });
      return Center(child: CircularProgressIndicator());
    }

    var size = MediaQuery.of(context).size;
    final myCoordinates =
        Coordinates(lat!, long!); // Replace with your own location lat, lng.
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    return Scaffold(
        body: !_serviceEnabled
            ? InkWell(
                onTap: () {
                  setState(() {
                    getLocation();
                  });
                },
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/location.json'),
                    Text(
                      "خدمة الموقع غير مفعلة",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(height: 25),
                    InkWell(
                      child: Container(
                        child: Text(
                          'اعادة المحاولة',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    )
                  ],
                )),
              )
            : SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Center(
                    child: Lottie.asset(
                      'assets/lottie/radio.zip',
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          // InkWell(
                          //   onTap:(){
                          //     Navigator.pushNamed(context, QiblahCompass.routeName);
                          //   },
                          //   child:ContainerDesign(
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //       children: [
                          //         text('اتجاة القبلة'),
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          ContainerDesign(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text('الفجر'),
                                text(DateFormat.jm().format(prayerTimes.fajr)),
                              ],
                            ),
                          ),
                          ContainerDesign(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text('الشروق'),
                                text(DateFormat.jm()
                                    .format(prayerTimes.sunrise)),
                              ],
                            ),
                          ),
                          ContainerDesign(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text('الظهر'),
                                text(DateFormat.jm().format(prayerTimes.dhuhr)),
                              ],
                            ),
                          ),
                          ContainerDesign(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text('العصر'),
                                text(DateFormat.jm().format(prayerTimes.asr)),
                              ],
                            ),
                          ),
                          ContainerDesign(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text('المغرب'),
                                text(DateFormat.jm()
                                    .format(prayerTimes.maghrib)),
                              ],
                            ),
                          ),
                          ContainerDesign(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text('العشاء'),
                                text(DateFormat.jm().format(prayerTimes.isha)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )));
  }

  ContainerDesign(
    Widget widget,
  ) {
    return Card(
      color: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 7),
      elevation: 10,
      child: Container(
          margin: EdgeInsets.all(7),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(12)),
          height: MediaQuery.of(context).size.height * 0.05,
          child: widget),
    );
  }

  text(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
    );
  }
}
