import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/Screens/auth/welcomeScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mama na Mwana",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        '/welcomePage': (context) => WelcomeScreen(),
      },
    );
  }
}
