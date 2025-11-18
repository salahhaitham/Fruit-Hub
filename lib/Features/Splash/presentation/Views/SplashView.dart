import 'package:ecommerce_app/Features/Splash/presentation/Views/widgets/SplashViewBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget{

  static const routename="splashview";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SplashViewBody(),

    );
  }
}