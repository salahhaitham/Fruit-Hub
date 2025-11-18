

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/App_TextStyles.dart';

class SocialTextButton extends StatelessWidget {
  const SocialTextButton({
    Key? key,
    required this.onpress,
    required this.title,
    required this.image,
  }) : super(key: key);

  final VoidCallback onpress;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: onpress,
        style: TextButton.styleFrom(
            shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Color(0xffDDDFDF),)
            )
        ),
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading:SvgPicture.asset(image) ,
          title: Text(title,style: AppTextStyles.heading16semiBold,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
