import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/entities/productEntity.dart';
import '../../../../../../../core/utils/App_TextStyles.dart';
import '../../../../../../../core/utils/Colors.dart';
import '../../../../../manager/CartCubit/Cart_cubit.dart';
import '../../../../../manager/favorite_cubit/favorite_cubit.dart';

class FavoriteItem extends StatefulWidget {
  final ProductEntity productItem;

  const FavoriteItem({Key? key, required this.productItem}) : super(key: key);

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  void initState() {
    context.read<FavoriteProuductCubit>()..loadFavorites();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Container(

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

    );
  }
}
