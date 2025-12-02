import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../core/utils/App_TextStyles.dart';
import '../../../../../../core/utils/gen/assets.gen.dart';

class Personal_Info_Container extends StatelessWidget {
  const Personal_Info_Container({
    super.key, required this.peresonalText, required this.svgPicture,
  });
final String peresonalText;
final SvgPicture svgPicture;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
                peresonalText,
                textAlign: TextAlign.right,
                style:AppTextStyles.body13Bold.copyWith(color: Colors.grey)
            ),
            Spacer(),
            svgPicture,
          ],
        ),
      ),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9FAFA),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: const Color(0xFFE6E9E9),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
