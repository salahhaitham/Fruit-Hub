import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:flutter/cupertino.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/gen/assets.gen.dart';
import 'FeaturedItemButton.dart';

class Featureditem extends StatelessWidget {
  const Featureditem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var featureditemWidth= MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: featureditemWidth,
        child: AspectRatio(
          aspectRatio: 342/158,
          child: Stack(
            children: [
              Positioned(
                  left: 0,top: 0,bottom: 0,right: featureditemWidth*0.4,
                  child: Image(image: svg.Svg(Assets.images.pageviewItem2Image),fit: BoxFit.fill,)),
              Container(
                width:featureditemWidth*0.5 ,
                decoration: BoxDecoration(
                  image: DecorationImage(image:svg.Svg(Assets.images.featuredItemBackground)
                  ,fit:BoxFit.fill
                  ),
      
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25,),
                      Text(
                        'عروض العيد',
                        style:AppTextStyles.body13Regular.copyWith(color: Colors.white)
                      ),
                      Spacer(),
      
                      Text(
                        'خصم 25%',
                        style:AppTextStyles.body19Bold.copyWith(color: Colors.white)
                      ),
                      SizedBox(height: 11,),
                     Featureditembutton(),
                      SizedBox(height: 29,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
