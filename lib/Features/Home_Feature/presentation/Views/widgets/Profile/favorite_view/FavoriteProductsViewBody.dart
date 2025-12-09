
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/favorite_view/FavoriteItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/entities/productEntity.dart';
import '../../../../../manager/favorite_cubit/load_favorite_products_cubit.dart';
import '../../Fruit_Item.dart';
import '../../GridViewFruitItem_BlocBuilder.dart';

class Favoriteproductsviewbody extends StatelessWidget {
  const Favoriteproductsviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
        SliverToBoxAdapter(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(children: [










    ]

    ),


    ),
    ),
          GridViewFavoriteItem_BlocBuilder(),
    ],
    );
  }
}


class GridViewFavoriteItem_BlocBuilder extends StatelessWidget {
  const GridViewFavoriteItem_BlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadFavoriteProductsCubit, LoadFavoriteProductsState>(
      builder: (context, state) {

        if(state is LoadFavoriteProductsSuccess){

          return GridviewFavoriteItems(products: state.favoritesList,);
        }else if(state is LoadFavoriteProductsFailure){
          return SliverToBoxAdapter(child: Center(child: Text(state.errormessage)));
        }else{
          return SliverToBoxAdapter(child: Text("loadingg"));
        }
      },
    );
  }
}
class GridviewFavoriteItems extends StatelessWidget {

  final List<ProductEntity> products;
  const GridviewFavoriteItems({
    Key? key,

    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {

        return FavoriteItem(productItem: products[index]);
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
