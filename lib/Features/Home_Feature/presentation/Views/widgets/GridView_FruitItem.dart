import 'package:ecommerce_app/Features/Home_Feature/manager/CartCubit/Cart_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/FruitItem_ViewDetails.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/animation/FruitItemAnimation.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Fruit_Item.dart';

class GridviewFruititem extends StatelessWidget {

  final List<ProductEntity> products;
  const GridviewFruititem({
    Key? key,

    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {

        return GestureDetector(
            onTap: () {
             Navigator.pushNamed(context, FruititemViewdetails.routename,arguments: products[index]);
            },
            child: FruitItem(productItem: products[index]));
      }, childCount: products.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
    );
  }
}
