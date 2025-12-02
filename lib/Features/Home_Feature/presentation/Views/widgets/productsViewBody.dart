import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/GridViewFruitItem_BlocBuilder.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/ProductsSearchTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/App_TextStyles.dart';
import '../../../../../core/utils/gen/assets.gen.dart';
import '../../../../../core/widgets/CustomAppBar.dart';
import 'ProductsHeader.dart';
import 'SearchTextfield.dart';

class Productsviewbody extends StatelessWidget {
  const Productsviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                buildAppBar(context:  context, title:  "المنتجات"),
                SizedBox(height: 12),
                ProductsSearchTextField(),
                SizedBox(height: 12),
                productsHeader(numberOfProducts:context.watch<ProductsCubit>().ProductsList.length),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
        GridViewFruitItem_BlocBuilder(),
      ],
    );
  }
}

