
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class Activestepview extends StatelessWidget {
  const Activestepview({Key? key, required this.text}) : super(key: key);
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          child: Icon(Icons.check,color: Colors.white,),
          backgroundColor: App_colors.primarycolor,

        ),
        SizedBox(width: 4,),
        Text(
         text,
          style: AppTextStyles.body13Bold,
        )
      ],
    );
  }
}
