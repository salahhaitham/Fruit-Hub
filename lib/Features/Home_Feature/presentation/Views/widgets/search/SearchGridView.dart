import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/search/lastSearchView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/App_TextStyles.dart';
import '../../../../manager/products_cubit/products_cubit.dart';
import '../GridView_FruitItem.dart';
import 'lastSearchItem.dart';

class Searchgridview_BlocBuilder extends StatelessWidget {
  const Searchgridview_BlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is getSearchedProductsSuccess) {
          return GridviewFruititem(products: state.products);
        } else if (state is getProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errmessage)),
          );
        }else if (state is getSearchedProductsLoding) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          final lastSearchList =
              (context.read<ProductsCubit>().box.get(
                        'lastsearch',
                        defaultValue: [],
                      )
                      as List)
                  .cast<String>();

          return LastSearchView1(lastSearchList: lastSearchList);
        
        }
        }
    );
      }

  }



