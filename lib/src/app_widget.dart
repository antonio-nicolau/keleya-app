import 'package:flutter/material.dart';
import 'features/home/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(90, 79, 217,1),
        accentColor: Color.fromRGBO(255, 255, 255,1),
        shadowColor: Color.fromRGBO(0, 0, 0, 1),
        errorColor: Color.fromRGBO(247, 7, 7,1),
        dividerColor: Color.fromRGBO(204, 204, 204,1),
        secondaryHeaderColor: Color.fromRGBO(243, 236, 255,1),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor)
        )
      ),
      home: HomePage(),
    );
  }
}
