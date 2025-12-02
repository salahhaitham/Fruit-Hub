
import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/GridView_FruitItem.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/search/SearchVew.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BestSellerHeader.dart';
import 'Custom_Home_Appbar.dart';
import 'FeaturedListView.dart';
import 'GridViewFruitItem_BlocBuilder.dart';
import 'SearchTextfield.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              CustomHomeAppBar(),
              SizedBox(height: 12,),
               Searchtextfield(),
              SizedBox(height: 12,),
              Featuredlistview(),
              SizedBox(height: 12,),
              Bestsellerheader(),
              SizedBox(height: 8,),



            ]

            ),


          ),
        ),
        GridViewFruitItem_BlocBuilder()
      ],
    );
  }
}

