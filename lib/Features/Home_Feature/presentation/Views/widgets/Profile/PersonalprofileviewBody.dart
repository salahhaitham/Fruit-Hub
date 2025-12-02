import 'package:ecommerce_app/core/Helper_Functions/getuser.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import 'Personal_Info_Container.dart';

class Personalprofileviewbody extends StatelessWidget {
  const Personalprofileviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 28),

          Row(
            children: [
              Text('المعلومات الشخصيه', style: AppTextStyles.heading13semiBold),
            ],
          ),
          SizedBox(height: 8),
          Personal_Info_Container(
            peresonalText: getUser().UserName,
            svgPicture: SvgPicture.asset(Assets.images.edit),
          ),
          SizedBox(height: 8),
          Personal_Info_Container(
            peresonalText: getUser().email,
            svgPicture: SvgPicture.asset(Assets.images.edit),
          ),
          SizedBox(height: 18),
          Text('تغيير كلمة المرور', style: AppTextStyles.heading13semiBold),
          SizedBox(height: 8,),

          SizedBox(height: 8,),
        ],
      ),
    );
  }
}
