import 'package:coivd_tracker_api/complexJson.dart';
import 'package:coivd_tracker_api/homepag.dart';
import 'package:coivd_tracker_api/login.dart';
import 'package:coivd_tracker_api/picture_upload.dart';
import 'package:coivd_tracker_api/pictutre_api.dart';
import 'package:coivd_tracker_api/product_api.dart';
import 'package:coivd_tracker_api/signup.dart';
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
      initialRoute: pic_upload.routename,
      routes: {
        homepage.routename: (context) => const homepage(),
        picture_api.routename:(context) => const picture_api(),
        complexJson.routename:(context) => const complexJson(),
        Product.routename : (context) => const Product(),
        Login.routename : (context) => const Login(),
        SIgnup.routename : (context) => const SIgnup(),
        picture_api.routename : (context) => const picture_api(),
        pic_upload.routename : (context) => const pic_upload(),
      },
    );
  }
}
