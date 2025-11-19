import 'package:ecommerce_app/Features/Home_Feature/manager/CartCubit/Cart_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/manager/CartItem/cart_item_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/CartHeader.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/CartItem.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/CartListView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/ProductsHeader.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/SearchTextfield.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/checkoutView.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/CustomAppBar.dart';
import '../../../../../core/widgets/CustomDivider.dart';

class Cartviewbody extends StatelessWidget {
  const Cartviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CartItemCubit();
      },
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    buildAppBar(
                      context: context,
                      title: "السلة",
                      showArrowBack: true,
                      showNotificationIcon: false,
                    ),
                    SizedBox(height: 16),
                    CartHeader(),
                    SizedBox(height: 24),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? SizedBox()
                    : CustomDivider(),
              ),
              CartListView(
                cartItems: context.watch<CartCubit>().cartEntity.cartItems,
              ),
              SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? SizedBox()
                    : CustomDivider(),
              ),
            ],
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: MediaQuery.of(context).size.height * 0.07,
            child: BlocBuilder<CartItemCubit,CartItemState>(
              builder: (context, state) =>
             CustomButton(
                text:
                    "الدفع  ${context.watch<CartCubit>().cartEntity.CaluculateTotalPrice()}جنيه"
                ,
                onpress: () {
                    Navigator.pushNamed(context, Checkoutview.routename);

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
