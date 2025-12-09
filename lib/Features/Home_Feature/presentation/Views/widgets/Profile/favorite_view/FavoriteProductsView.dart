
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/favorite_view/FavoriteProductsViewBody.dart';
import 'package:ecommerce_app/Features/Home_Feature/data/repos/LoadFavoritesRepoImp.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../manager/favorite_cubit/load_favorite_products_cubit.dart';

class Favoriteproductsview extends StatelessWidget {
  const Favoriteproductsview({Key? key}) : super(key: key);
static const routename="favoriteview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("المفضلة ",style: AppTextStyles.body19Bold,),
        centerTitle: true,
        leading:
        GestureDetector(
          onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_rounded)),
        
      ),
      body: BlocProvider(
          create: (context) {
            return LoadFavoriteProductsCubit(getIt.get<LoadFavoritesRepoImp>())..loadFavProducts();
          },

          child: Favoriteproductsviewbody()),
    );
  }
}
