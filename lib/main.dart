import 'package:flutter/material.dart';
import 'package:friends_flutter/data/api.dart';
import 'package:friends_flutter/ui/friends/friends_screen.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() {
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Friends',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FriendsScreen(),
    );
  }
}
