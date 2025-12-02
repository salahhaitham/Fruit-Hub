import 'dart:developer';

import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'GridView_FruitItem.dart';

class GridViewFruitItem_BlocBuilder extends StatelessWidget {
  const GridViewFruitItem_BlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {

        if(state is getProductsSuccess){

       return GridviewFruititem(products: state.products,);
        }else if(state is getProductsFailure){
          return Center(child: Text(state.errmessage));
        }else{
        return SliverToBoxAdapter(child: Text("loadingg"));
        }
      },
    );
  }
}
