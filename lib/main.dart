import 'package:flutter/material.dart';
import 'package:ukl_knya_keren/pages/login.dart';
import 'package:ukl_knya_keren/pages/splash.dart';
import 'package:ukl_knya_keren/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      theme: ThemeData(
        fontFamily: "Popins"
      ),
      routes: {
        "/splash": (context) => splashScreen(),
        "/login": (context) => loginPage(),
        "/home": (context) => homePage(),
        // "/profile": (context) => profilePage(),
      },

    );
  }
}
