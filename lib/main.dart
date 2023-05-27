import 'package:flutter/material.dart';
import 'package:rise/pages/details.dart';
import 'package:rise/pages/index.dart';
import 'package:rise/theme/colours.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:ThemeData(
      primaryColor: primary,
    ),
   home: IndexPage(),
  ));
}

