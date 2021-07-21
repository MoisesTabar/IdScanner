import 'package:flutter/material.dart';
import 'package:id_scanner/src/pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: HomePage(),
    );
  }
}