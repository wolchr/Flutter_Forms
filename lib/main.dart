import 'package:flutter/material.dart';

import 'package:app_flutter_forms/screens/login_screen.dart';
import 'package:app_flutter_forms/screens/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Forms',
      theme: ThemeData.dark().copyWith(accentColor: Colors.lightBlue),
      home:
          LoginScreen(), //Load screens manually LoginScreen(), RegisterScreen()
    );
  }
}
