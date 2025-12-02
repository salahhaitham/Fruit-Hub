import 'package:ecommerce_app/Features/Home_Feature/manager/CartCubit/Cart_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Custom_Home_Appbar.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/GridViewFruitItem_BlocBuilder.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/SearchTextfield.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/search/SearchGridView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/search/SearchViewBody.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:ecommerce_app/core/repos/product_repo/products_repoImp.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../core/widgets/NotificationWidget.dart';
import '../../../../../../generated/assets.dart';

class Searchvew extends StatelessWidget {
  const Searchvew({Key? key, }) : super(key: key);
  static const routename = "searchview";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>    ProductsCubit(getIt.get<ProductRepoImpl>())),

      ],


        child: Scaffold(
            backgroundColor: Colors.white,
            body: Searchviewbody()));
  }
}





