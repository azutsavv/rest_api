import 'package:coivd_tracker_api/homepag.dart';
import 'package:coivd_tracker_api/pictutre_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homepage.routename,
      routes: {
        homepage.routename: (context) => const homepage(),
        picture_api.routename:(context) => const picture_api(),
      },
    );
  }
}
