
import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/GridView_FruitItem.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/HomeViewBody.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:ecommerce_app/core/repos/product_repo/products_repoImp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/BestSellerHeader.dart';
import 'widgets/Custom_Home_Appbar.dart';
import 'widgets/FeaturedListView.dart';
import 'widgets/SearchTextfield.dart';

class Homeview extends StatelessWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return ProductsCubit(getIt.get<ProductRepoImpl>());
        },
        child: HomeViewBody());
  }
}

