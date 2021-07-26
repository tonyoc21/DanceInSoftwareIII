import 'package:crud/pages/ensayo_page.dart';
import 'package:crud/pages/list_page.dart';
import 'package:crud/pages/init_page.dart';
import 'package:crud/pages/login_admin.dart';
import 'package:crud/pages/password_page.dart';
import 'package:crud/pages/save_page.dart';
import 'package:crud/pages/view_page.dart';
import 'package:crud/pages/view_page1.dart';
import 'package:crud/pages/choose_page.dart';
import 'package:crud/pages/choose_page1.dart';
import 'package:crud/pages/choosePassword_page.dart';
import 'package:crud/pages/list_pageE.dart';
import 'package:crud/pages/save_pageE.dart';
import 'package:crud/pages/init_page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String usuario = 'admin';

  String contrasena = '12345678';

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
        "/login": (BuildContext context) => LoginAdminPage(usuario, contrasena),
        "/init": (BuildContext context) => InitPage(),
        "/init1": (BuildContext context) => InitPage1(),
        "/list": (BuildContext context) => ListPage(),
        "/list1": (BuildContext context) => ListPage1(),
        "/choose": (BuildContext context) => ChoosePagee(),
        "/choosePassword": (BuildContext context) => ChoosePasswordPage(),
        "/password": (BuildContext context) => PasswordPage(),
        "/choose1": (BuildContext context) => ChoosePage(),
        "/save": (BuildContext context) => SavePage(),
        "/save1": (BuildContext context) => SavePage1(),
        "/view": (BuildContext context) => ViewPage(),
        "/view1": (BuildContext context) => ViewPage1(),
        "/ensayo": (BuildContext context) => EnsayoPage()
      },
    );
  }
}
