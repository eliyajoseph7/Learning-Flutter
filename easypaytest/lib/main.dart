import 'package:easypay/pages/home.dart';
import 'package:easypay/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => Home(),
      },
    ));
