import 'package:crud/pages/ensayo_page.dart';
import 'package:crud/pages/list_page.dart';
import 'package:crud/pages/init_page.dart';
import 'package:crud/pages/login_admin.dart';
import 'package:crud/pages/save_page.dart';
import 'package:crud/pages/view_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.red[900],
      ),

      initialRoute: "/ensayo",
      routes: {
        "/login": (BuildContext context) => LoginAdminPage(),
        "/init": (BuildContext context) => InitPage(),
        "/list": (BuildContext context) => ListPage(),
        "/save": (BuildContext context) => SavePage(),
        "/view": (BuildContext context) => ViewPage(),
        "/ensayo": (BuildContext context) => EnsayoPage()
      },
    );
  }
}
