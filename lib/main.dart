// @dart=2.9
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/frame.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/playScreen.dart';
import 'package:flutter_application_1/providers/songProvider.dart';

import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SongProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => MyApp(),
          "/home": (context) => Home(),
          "/Frame": (context) => Frame(),
          "/playscreen": (context) => PlayScreen(),
        },
      )));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 3000), () {
      Navigator.pushNamed(context, '/home');
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xFF293241),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: screenHeight * .35,
          ),
          Text(
            "GLOW MUSIC",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(
                  0xFFE0FBFC,
                ),
                fontSize: 36),
          ),
          Lottie.asset("assets/animation.json")
        ]),
      ),
    );
  }
}
