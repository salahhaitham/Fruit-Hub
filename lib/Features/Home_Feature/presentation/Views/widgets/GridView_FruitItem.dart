import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/animation/FruitItemAnimation.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:flutter/cupertino.dart';

import 'Fruit_Item.dart';

class GridviewFruititem extends StatelessWidget {
  final bool isLoading;
  final List<ProductEntity> products;
  const GridviewFruititem({
    Key? key,
    this.isLoading = false,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (isLoading) return const FruitItemSkeleton();
        return FruitItem(productItem: products[index]);
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
