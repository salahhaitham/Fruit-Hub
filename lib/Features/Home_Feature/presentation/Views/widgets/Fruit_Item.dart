import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/gen/assets.gen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../manager/CartCubit/Cart_cubit.dart';
import '../../../manager/favorite_cubit/favorite_cubit.dart';

class FruitItem extends StatefulWidget {
  const FruitItem({Key? key,required this.productItem}) : super(key: key);
 final ProductEntity productItem;

  @override
  State<FruitItem> createState() => _FruitItemState();
}

class _FruitItemState extends State<FruitItem> {
  @override
  void initState() {
    context.read<FavoriteProuductCubit>()..loadFavorites();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  BlocListener<FavoriteProuductCubit,FavoriteState>(
      listener: (context, state) {
        if(state is AddFavoritesuccess){
          showSnackBar(context, "تم اضافة المنتج الي المفضلة بنجاح ");
        }
      },
      child: Container(

          decoration: ShapeDecoration(
          color: const Color(0xFFF3F5F7),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        child: Stack(
          children: [
            IconButton(onPressed: (){
              context.read<FavoriteProuductCubit>().toggleFavorite(widget.productItem);

            },
                icon:StreamBuilder<List<String>>(
                  stream: context.read<FavoriteProuductCubit>().favoritesStream,
                  builder: (context, snapshot) {
                    final favorites = snapshot.data ?? [];
                    final isFav = favorites.contains(widget.productItem.code);

                    return IconButton(
                      onPressed: () => context.read<FavoriteProuductCubit>().toggleFavorite(widget.productItem),
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_outline_outlined,
                        color: isFav ? Colors.red : Colors.grey,
                      ),
                    );
                  },
                )

            ),
            Positioned.fill(
                child: Column(
              children: [
                SizedBox(height: 20,),
                Flexible(child: Image.network(widget.productItem.imageUrl??"",)),
                SizedBox(height: 24,),
                ListTile(
                  title:   Text(
                    widget.productItem.name??"unknown",
                    textAlign: TextAlign.right,
                    style:AppTextStyles.heading13semiBold
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${widget.productItem.price??0}',
                          style:AppTextStyles.body13Bold.copyWith(color: App_colors.secondrycolor)
                        ),
                        TextSpan(
                          text: '/',
                          style:AppTextStyles.body13Bold.copyWith(color: App_colors.secondrycolor)
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style:AppTextStyles.heading13semiBold.copyWith(color: App_colors.SecondryLightcolor)
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addproduct(widget.productItem);
                    },
                    child: CircleAvatar(
                      backgroundColor: App_colors.primarycolor,
                      child: Icon(Icons.add,color: Colors.white,),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),

      ),
    );
  }
}
