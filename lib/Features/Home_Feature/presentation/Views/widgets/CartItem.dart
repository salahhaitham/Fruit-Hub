import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';
import 'package:ecommerce_app/Features/Home_Feature/manager/CartCubit/Cart_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/manager/CartItem/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/gen/assets.gen.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key,required this.cartItemEntity}) : super(key: key);
final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit,CartItemState>(
      buildWhen: (previous, current) {
        if(current is CartItemUpdated){
          if(current.cartItemEntity==cartItemEntity){
            return true;
          }
        }
        return false;
          },
     builder: (context, state) =>  Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            // صورة المنتج
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F5F7),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image:NetworkImage(cartItemEntity.productEntity.imageUrl!),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 16),

            // تفاصيل المنتج
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الاسم و أيقونة الحذف
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          cartItemEntity.productEntity.name,
                          style: AppTextStyles.body16Bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<CartCubit>().removeproduct(cartItemEntity.productEntity);
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.asset(
                            Assets.images.trash,
                            width: 18,
                            height: 18,
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '${cartItemEntity.count} كم',
                    style: AppTextStyles.body13Regular
                        .copyWith(color: App_colors.secondrycolor),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      CartitemAction(
                        ontap: () {
                         cartItemEntity.increaseCount();
                         context.read<CartItemCubit>().updateCartItem(cartItemEntity);
                        },
                        color: App_colors.primarycolor,
                        icon: const Icon(Icons.add, color: Colors.white, size: 16),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        cartItemEntity.count.toString(),
                        style: AppTextStyles.body16Bold,
                      ),
                      const SizedBox(width: 10),
                      CartitemAction(
                        ontap: () {
                        cartItemEntity.decreaseCount();
                        context.read<CartItemCubit>().updateCartItem(cartItemEntity);
                        },
                        color: const Color(0xFFF3F5F7),
                        icon:
                        const Icon(Icons.remove, color: Colors.black, size: 16),
                      ),
                      const Spacer(),
                      Text(
                        "${cartItemEntity.getTotalPrice()} جنيه"

                        ,
                        style: AppTextStyles.body16Bold.copyWith(
                          color: App_colors.secondrycolor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartitemAction extends StatelessWidget {
  const CartitemAction({
    Key? key,
    required this.color,
    required this.icon, required this.ontap,
  }) : super(key: key);

  final Color color;
  final Icon icon;
final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: const Color(0xFFF1F1F5)),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
