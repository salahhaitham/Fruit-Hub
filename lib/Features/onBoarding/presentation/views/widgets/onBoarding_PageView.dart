import 'package:ecommerce_app/Features/onBoarding/presentation/views/widgets/PageViewItem.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/gen/assets.gen.dart';

class onBoardingPageView extends StatelessWidget {



final  PageController pageController;

  const onBoardingPageView({super.key, required this.pageController});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: PageView(
        controller: pageController,
        children: [

          PageViewItem(


            isvisible:true,
            image:Assets.images.pageViewItem1Image,
            backgroundimage: Assets.images.pageviewitem1Backgroudimage,
            subtitle: "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("مرحبا بك في ",style:AppTextStyles.heading23Bold,),
              Text("Hub",style: AppTextStyles.heading23Bold.copyWith(color: App_colors.secondrycolor),),
              Text("Fruit",style: AppTextStyles.heading23Bold.copyWith(color: App_colors.primarycolor),),
            ],),
          ),
          PageViewItem(
            isvisible:false,
              image:Assets.images.pageviewItem2Image,
              backgroundimage: Assets.images.pageviewItem2Background,
              subtitle: "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
              title: Text("ابحث وتسوق",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),)
          ),




        ],
      ),
    );
  }
}
