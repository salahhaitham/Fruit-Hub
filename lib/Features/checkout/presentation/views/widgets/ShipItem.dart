
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter/material.dart';

class Shipitem extends StatelessWidget {
  const Shipitem({Key? key, required this.title, required this.subTitle, required this.price, required this.isSelected, required this.onaTap}) : super(key: key);

  final String title,subTitle;
  final num price;
  final bool isSelected;
  final VoidCallback onaTap;
  @override
  Widget build(BuildContext context) {
   return  GestureDetector(
     onTap:onaTap ,
     child: Container(

        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),

        decoration: BoxDecoration(
          color: const Color(0x33D9D9D9),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(  color: isSelected ? App_colors.primarycolor : Colors.transparent,
            width: 2,)
        ),
       child: IntrinsicHeight(
         child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
         isSelected?Activecontainer():InActivecontainer(),
             SizedBox(width: 10,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   title,
                   style:AppTextStyles.heading13semiBold.copyWith(color: Colors.black)
                 ),
                 Text(
                   subTitle,
                   textAlign: TextAlign.right,
                   style:AppTextStyles.body13Regular.copyWith(color: Colors.black.withValues(alpha: 0.5)))
               ],
             ),
             Spacer(),
             Center(
               child: Text(
                 " ${price} جنيه",
                 style:AppTextStyles.body13Bold.copyWith(color: App_colors.primarycolor)
               ),
             )

           ],
         ),
       ),
      ),
   );
  }
}

class InActivecontainer extends StatelessWidget {
  const InActivecontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
      ),
    );
  }
}
class Activecontainer extends StatelessWidget {
  const Activecontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: const Color(0xFF1B5E37) /* Green1-500 */,
        shape: OvalBorder(
          side: BorderSide(width: 4, color: Colors.white),
        ),
      ),
    );
  }
}
