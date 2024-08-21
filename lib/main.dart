import 'package:flutter/material.dart';
import 'package:gymbuddy_github/homepage/homepage.dart';

//  this flutter project use 2 kind of local data storage :
//  - hive storage => for complex data storage like exercices
//  - sharedpreferences storage => for simple data storage like week days titles

void main() {
  //initialise Hive data storage system for complex data
  runApp(const MainApp());
}

//  route Observer method variable used in the carousel slider of the workout page
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
//  allow the pages to be initStated when going back from the arrow_back icon of the appbar
//  useful when user change his workout, the carousel slider content will be updated

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
    );
  }
}
