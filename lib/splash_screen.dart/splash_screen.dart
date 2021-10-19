import 'package:flutter/material.dart';
import 'package:formulario/form_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreenToHomePage extends StatefulWidget {
  const SplashScreenToHomePage({Key? key}) : super(key: key);

  @override
  _SplashScreenToHomePageState createState() => _SplashScreenToHomePageState();
}

class _SplashScreenToHomePageState extends State<SplashScreenToHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreenView(
          navigateRoute: FormPage(
            title: 'Cadastrar dados',
          ),
          duration: 5000,
          imageSize: 130,
          imageSrc: "assets/images/logo.png",
          text: "Escola do saber",
          textType: TextType.ColorizeAnimationText,
          textStyle: TextStyle(
            fontSize: 40.0,
          ),
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          backgroundColor: Colors.white,
        )
      ],
    );
  }
}
