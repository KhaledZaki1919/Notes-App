import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/eddit.dart';
import 'package:notes/presentation/pages/homescreen.dart';
import 'package:notes/utils/constants/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeData LithtTheme = ThemeData(
        primarySwatch: primaryBlack,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
        scaffoldBackgroundColor: Colors.white);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LithtTheme,
      home: HomeScreen(),
    );
  }
}
