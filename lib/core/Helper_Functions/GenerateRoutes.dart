import 'package:ecommerce_app/Features/Auth/presentation/Views/Login_page.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/SignUp_pageView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/Main_View.dart';
import 'package:ecommerce_app/Features/Splash/presentation/Views/SplashView.dart';
import 'package:ecommerce_app/Features/onBoarding/presentation/views/onBoardingView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Features/Home_Feature/presentation/Views/widgets/BestSelling_Widgets/BestSellingView.dart';

Route<dynamic> onGenerateRoute (RouteSettings settings){

  switch(settings.name){
    case SplashView.routename:
      return MaterialPageRoute(builder: (context) => SplashView(),);
    case onBoardingView.routename:
      return MaterialPageRoute(builder: (context) => onBoardingView(),);
    case  SignupPageview.routename:
      return MaterialPageRoute(builder: (context) => SignupPageview(),);
    case  Bestsellingview.routename:
      return MaterialPageRoute(builder: (context) => Bestsellingview(),);
    case LoginPage.routename:
      return MaterialPageRoute(builder: (context) => LoginPage(),);
    case MainView.routename:
      return MaterialPageRoute(builder: (context) => MainView(),);
  default:
    return MaterialPageRoute(builder: (context) => Scaffold(),);

  }
}


