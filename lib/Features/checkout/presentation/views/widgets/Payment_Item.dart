
import 'package:ecommerce_app/core/utils/AppDecorations.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({Key? key, required this.text, required this.widget}) : super(key: key);
final String text;
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextStyles.body13Bold
        ),
        Container(
          decoration: AppDecoration.greyShapDecoration,
          child:widget,
        ),
      ],
    );
  }
}
