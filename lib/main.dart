import 'package:crud/pages/list_page.dart';
import 'package:crud/pages/save_page.dart';
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
      initialRoute: ListPage.ROUTE,
      routes: {
        ListPage.ROUTE : (_) => ListPage(),
        SavePage.ROUTE : (_) => SavePage()
      },
    );
  }
}