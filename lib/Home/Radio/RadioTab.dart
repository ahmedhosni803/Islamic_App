import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Lottie.asset(
              'assets/lottie/Baby.json',
              width: 500,
              fit: BoxFit.fill,
            ),
            Lottie.asset(
              'assets/lottie/soon.json',
              width: 200,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
