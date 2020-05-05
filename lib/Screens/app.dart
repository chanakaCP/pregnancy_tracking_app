import 'package:flutter/material.dart';

import 'welcomePage.dart';
import 'signIn.dart';
import 'signUp.dart';

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
