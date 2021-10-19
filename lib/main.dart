import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:formulario/form_page.dart';
import 'package:formulario/splash_screen.dart/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenToHomePage());
  }
}
