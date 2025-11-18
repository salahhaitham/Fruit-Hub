import 'package:ecommerce_app/Features/Auth/presentation/Views/Login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../Features/Auth/presentation/Views/SignUp_pageView.dart';
import '../utils/App_TextStyles.dart';
import '../utils/Colors.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const TermsAndConditionsWidget({super.key, required this.value, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform.translate(
      offset: Offset(14, 0),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: App_colors.primarycolor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),


              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - (2 * 16) - 48,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'من خلال إنشاء حساب ، فإنك توافق على',
                    style: AppTextStyles.heading13semiBold.copyWith(color: Color(0xFF949D9E)),
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
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {

                      },
                    text: ' الشروط والأحكام الخاصة بنا',
                    style: AppTextStyles.heading13semiBold.copyWith(
                      color: Color(0xFF2D9F5D),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
