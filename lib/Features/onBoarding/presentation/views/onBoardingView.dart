
import 'package:ecommerce_app/Features/onBoarding/presentation/views/widgets/onBoardingViewBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class onBoardingView extends StatelessWidget {
  static const String routename="onbardingview";
  const onBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(child: onBoardingViewBody()) ,
    );
  }
}
