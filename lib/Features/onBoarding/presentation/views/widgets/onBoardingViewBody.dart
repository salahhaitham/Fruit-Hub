import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/Login_page.dart';
import 'package:ecommerce_app/Features/onBoarding/presentation/views/widgets/onBoarding_PageView.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/cupertino.dart';

class onBoardingViewBody extends StatefulWidget {
  @override
  State<onBoardingViewBody> createState() => _onBoardingViewBodyState();
}

class _onBoardingViewBodyState extends State<onBoardingViewBody> {
  late PageController pageController;
  var currentpage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      if (pageController.hasClients && pageController.page != null) {
        currentpage = pageController.page!.round();
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        onBoardingPageView(pageController: pageController),
        DotsIndicator(
          position: currentpage.toDouble(),
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: App_colors.primarycolor,
            color: App_colors.primarycolor.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 29),
        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          visible: currentpage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: "ابدأ الان", onpress: () {
              SharedPrefernceSinglton.setBool(KisOnBoardingSeen, true);
              Navigator.pushReplacementNamed(context, LoginPage.routename);
            }),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
