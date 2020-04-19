import 'package:flutter/material.dart';
import 'welcomePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mama na Mwana",
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      initialRoute: '/welcomePage',
      routes: {
        '/welcomePage': (context) => WelcomePage(),
      },
    );
  }
}
