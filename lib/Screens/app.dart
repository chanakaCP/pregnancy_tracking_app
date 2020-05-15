import 'package:flutter/material.dart';

import 'package:pregnancy_tracking_app/Screens/welcomePage.dart';
import 'package:pregnancy_tracking_app/Screens/signIN/signIn.dart';
import 'package:pregnancy_tracking_app/Screens/signUP/signUp.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mama na Mwana",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomePage(),
      initialRoute: '/welcomePage',
      routes: {
        '/welcomePage': (context) => WelcomePage(),
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        // '/registration': (context) => Registration(),
        // '/slider': (context) => SliderPage(),
        // '/home': (context) => Home(),
      },
    );
  }
}
