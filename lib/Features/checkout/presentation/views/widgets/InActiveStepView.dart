
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/App_TextStyles.dart';
import '../../../../../core/utils/Colors.dart';

class Inactivestepview extends StatelessWidget {
  const Inactivestepview({Key? key, required this.index, required this.text}) : super(key: key);
final String index,text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11.5,
          child:Text(
            index,
            style:AppTextStyles.heading13semiBold.copyWith(color: Color(0xFF0C0D0D)),),
          backgroundColor: Color(0xFFF2F3F3),

        ),
        SizedBox(width: 4,),
        Text(
          text,
          style: AppTextStyles.heading13semiBold.copyWith(color: Color(0xFFAAAAAA)),
        )
      ],
    );
  }
}
