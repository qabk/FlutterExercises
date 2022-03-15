import 'package:basic_login/pages/home.dart';
import 'package:basic_login/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyLogin(),
        '/home': (context) => Home(),
      },
    ));
