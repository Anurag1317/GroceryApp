import 'package:bookstore/constants.dart';
import 'package:bookstore/routes.dart';

import 'package:bookstore/screens/splashScreen/splash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kprimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kprimaryColor),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
    
  }
}
