import 'package:ecommerce_app/Features/Auth/presentation/Views/Login_page.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/Main_View.dart';
import 'package:ecommerce_app/Features/onBoarding/presentation/views/onBoardingView.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/Services/FirebaseAuthService.dart';
import 'package:ecommerce_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/gen/assets.gen.dart';

class SplashViewBody extends StatefulWidget {
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    ExecuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [SvgPicture.asset(Assets.images.plant)],
          ),
          SvgPicture.asset(Assets.images.splashIcon),
          SvgPicture.asset(fit: BoxFit.fill, Assets.images.splashBottom),
        ],
      ),
    );
  }

  void ExecuteNavigation() {
    Future.delayed(const Duration(seconds: 1), () {
      bool isonBoardingseen =
          SharedPrefernceSinglton.getBool(KisOnBoardingSeen) ?? false;
      if (isonBoardingseen) {
        bool isloggedin=FirebaseAuthService().IsLoggedIn();
        if(isloggedin){
          Navigator.pushNamed(context, MainView.routename);
        }else{
          Navigator.pushReplacementNamed(context, LoginPage.routename);
        }


      } else {
        Navigator.pushReplacementNamed(context, onBoardingView.routename);
      }
    });
  }
}
