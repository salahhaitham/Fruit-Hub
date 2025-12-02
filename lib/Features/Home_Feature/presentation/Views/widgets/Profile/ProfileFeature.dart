
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../core/utils/App_TextStyles.dart';

class profile_Feature extends StatelessWidget {
  const profile_Feature({
    super.key, required this.svgPicture, required this.ProfileFeatureText,
  });
final SvgPicture svgPicture;
final String ProfileFeatureText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        svgPicture,
        SizedBox(width: 8,),
        Text(
          ProfileFeatureText       ,
          style: AppTextStyles.heading13semiBold.copyWith(color: Colors.grey),
        ),
        Spacer(),
        Directionality(
            textDirection:TextDirection.ltr,
            child: Icon(Icons.arrow_back_ios_rounded,)),
      ],
    );
  }
}