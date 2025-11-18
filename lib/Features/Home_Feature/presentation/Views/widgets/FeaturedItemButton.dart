import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/Colors.dart';


class Featureditembutton extends StatelessWidget {
  Featureditembutton({Key? key, this.onPressed}) : super(key: key);
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,

      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),

        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: FittedBox(
            child: Text(
              "تسوق الان",
              style:AppTextStyles.body13Bold.copyWith(color:App_colors.primarycolor)
            ),
          ),
        ),
      ),
    );
  }
}
