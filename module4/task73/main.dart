import 'package:flutter/material.dart';


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


void main()
{
  runApp(MaterialApp(home: SplashScreen()));
}
class SplashScreen extends StatefulWidget
{
  @override
  SplashState createState() => SplashState();

}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),

          () => Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 300, height: 300,),
            Lottie.network(
              "https://keval333.000webhostapp.com/images/animation_lo5joikx.json",
              height: 200.0,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}