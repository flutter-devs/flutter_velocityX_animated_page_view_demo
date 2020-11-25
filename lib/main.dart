import 'package:flutter/material.dart';
import 'package:velocityx_animated_page_view/home_page.dart';
import 'package:velocityx_animated_page_view/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
        ThemeData(primarySwatch: Colors.indigo,
            brightness: Brightness.light
        ),
        debugShowCheckedModeBanner: false,
        home: Splash()
    );
  }
}
