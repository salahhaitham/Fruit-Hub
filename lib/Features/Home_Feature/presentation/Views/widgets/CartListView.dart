
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/CartItem.dart';
import 'package:ecommerce_app/core/widgets/CustomDivider.dart';
import 'package:flutter/cupertino.dart';

class CartListView extends StatelessWidget {
  const CartListView({Key? key,required this.cartItems}) : super(key: key);
final List<CartItemEntity>cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount:cartItems.length,
      itemBuilder: (context, index) {
        return CartItem(cartItemEntity: cartItems[index],);
      },
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
    );
  }
}