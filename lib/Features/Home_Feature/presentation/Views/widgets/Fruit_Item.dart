import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/gen/assets.gen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../manager/CartCubit/Cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({Key? key,required this.productItem}) : super(key: key);
 final ProductEntity productItem;
  @override
  Widget build(BuildContext context) {

    return  Container(

        decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      child: Stack(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_outlined)),
          Positioned.fill(
              child: Column(
            children: [
              SizedBox(height: 20,),
              Flexible(child: Image.network(productItem.imageUrl??"")),
              SizedBox(height: 24,),
              ListTile(
                title:   Text(
                  productItem.name??"unknown",
                  textAlign: TextAlign.right,
                  style:AppTextStyles.heading13semiBold
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${productItem.price??0}',
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
                    context.read<CartCubit>().addproduct(productItem);
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
