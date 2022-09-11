import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Lottie.asset(
              'assets/lottie/radio.zip',
              width: 600,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.skip_next_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 50,
                  ),
                  Icon(
                    Icons.play_arrow_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 60,
                  ),
                  Icon(
                    Icons.skip_previous_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
