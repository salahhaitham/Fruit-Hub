import 'package:ecommerce_app/Features/Auth/presentation/Views/Login_page.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/SignUp_pageView.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/widets/ResetPasswordView.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/Main_View.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/profileView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/FruitItem_ViewDetails.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/Notification_View.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/OrdersViewBody.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/favorite_view/FavoriteProductsView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/ordersView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/persomalProfileView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/search/SearchVew.dart';
import 'package:ecommerce_app/Features/Splash/presentation/Views/SplashView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/checkoutView.dart';
import 'package:ecommerce_app/Features/onBoarding/presentation/views/onBoardingView.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Features/Home_Feature/presentation/Views/widgets/BestSelling_Widgets/BestSellingView.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routename:
      return MaterialPageRoute(builder: (context) => SplashView());
    case onBoardingView.routename:
      return MaterialPageRoute(builder: (context) => onBoardingView());
    case SignupPageview.routename:
      return MaterialPageRoute(builder: (context) => SignupPageview());
    case Bestsellingview.routename:
      return MaterialPageRoute(builder: (context) => Bestsellingview());
    case Searchvew.routename:
      return MaterialPageRoute(builder: (context) => Searchvew());
    case ForgotPasswordScreen.routename:
      return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
    case Ordersview.routename:
      return MaterialPageRoute(builder: (context) => Ordersview());
    case NotificationView.routename:
      return MaterialPageRoute(builder: (context) => NotificationView());
    case Personalprofileview.routename:
      return MaterialPageRoute(builder: (context) => Personalprofileview());
    case Favoriteproductsview.routename:
      return MaterialPageRoute(builder: (context) => Favoriteproductsview());
    case Profileview.routename:
      return MaterialPageRoute(builder: (context) => Profileview());
    case FruititemViewdetails.routename:
      return MaterialPageRoute(
        builder: (context) {
          return FruititemViewdetails(
            productEntity: settings.arguments as ProductEntity,
          );
        },
      );
    case LoginPage.routename:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case MainView.routename:
      return MaterialPageRoute(builder: (context) => MainView());
    case Checkoutview.routename:
      return MaterialPageRoute(
        builder: (context) =>
            Checkoutview(cartEntity: settings.arguments as CartEntity),
      );
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
