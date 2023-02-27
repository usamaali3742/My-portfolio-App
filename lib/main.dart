
import 'package:flutter/material.dart';
import 'package:portfolioapp/about.dart';
import 'package:portfolioapp/home.dart';
import 'package:portfolioapp/projects.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: "Soho",
    ),
    initialRoute: 'home',
    debugShowCheckedModeBanner: false,
    routes: {
      'home': (context) => Myhome(),
      'about': (context)=> MyAbout(),
      'projects': (context) => MyProjects()

    },
  ));
}
