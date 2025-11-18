
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/cupertino.dart';

import 'BestSelling_Widgets/BestSellingView.dart';

class Bestsellerheader extends StatelessWidget {
  const Bestsellerheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.pushNamed(context, Bestsellingview.routename);
      },
      child: Row(
        children: [
        Text(
        'الأكثر مبيعًا',
        textAlign: TextAlign.right,
        style:AppTextStyles.body16Bold.copyWith(color:  Color(0xFF0C0D0D),
        ),
        ),
      Spacer(),
      Text(
      'المزيد',
      textAlign: TextAlign.center,
      style:AppTextStyles.body13Regular.copyWith(color:  Color(0xFF949D9E)),
      ),
        ],
      ),
    );
  }
}
