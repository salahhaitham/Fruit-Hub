
import '../../../../../core/utils/gen/assets.gen.dart';

class bottomNavBarEntity{

  String activeImage,inActiveImage;
  String title;

  bottomNavBarEntity({required this.activeImage,required this.inActiveImage,required this.title});


}
List<bottomNavBarEntity>get bottomNavBarItems =>[
  bottomNavBarEntity(
      activeImage: Assets.images.bottomNav.bold.homeBold,
      inActiveImage: Assets.images.bottomNav.home,
      title: "الرئيسية"
  ),
  bottomNavBarEntity(
      activeImage: Assets.images.bottomNav.bold.categoriesBold,
      inActiveImage: Assets.images.bottomNav.category,
      title: "المنتجات"
  ),
  bottomNavBarEntity(
      activeImage: Assets.images.bottomNav.bold.shoppingCartBold,
      inActiveImage: Assets.images.bottomNav.shoppingCart,
      title: "سلة التسوق"
  ),
  bottomNavBarEntity(
      activeImage: Assets.images.bottomNav.bold.userBold,
      inActiveImage: Assets.images.bottomNav.user,
      title: "حسابي"
  ),


];