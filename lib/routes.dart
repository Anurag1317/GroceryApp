
import 'package:bookstore/screens/home/components/home_screen.dart';
import 'package:bookstore/screens/signup.dart';
import 'package:bookstore/screens/splashScreen/splash_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignupPage.routeName: (context) => SignupPage(),
  HomeScreen.routename:(context)=> HomeScreen(),


};
