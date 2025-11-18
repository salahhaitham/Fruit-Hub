import 'package:ecommerce_app/Features/Auth/presentation/Views/Login_page.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/SignUp_pageView.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../utils/App_TextStyles.dart';

class HaveAnAcoount_Widget extends StatelessWidget {
  const HaveAnAcoount_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: ' تمتلك حساب بالفعل؟',
            style: TextStyle(
              color: const Color(0xFF616A6B) /* Green1-500 */,
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              height: 1.40,
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyle(
              color: const Color(0xFF616A6B) /* Grayscale-600 */,
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              height: 1.40,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap=(){
              Navigator.pushNamed(context, LoginPage.routename);
            },
            text: 'تسجيل الدخول',
            style:AppTextStyles.heading16semiBold.copyWith(color: App_colors.primarycolor),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
