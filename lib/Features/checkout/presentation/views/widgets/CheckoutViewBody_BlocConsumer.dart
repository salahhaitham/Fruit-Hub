import 'dart:developer';

import 'package:ecommerce_app/Features/checkout/manager/orders/orders_cubit.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CheckoutviewbodyBlocconsumer extends StatelessWidget {
  const CheckoutviewbodyBlocconsumer({Key? key, required this.widget})
    : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},

      builder: (context, state) {
        if (state is OrdersSuccess){
          log("succes");
        return widget;}
        else if(state is OrdersFailure){
         showSnackBar(context, "proccess failed");
        }
        else if(state is OrdersLoading){
          return ModalProgressHUD(inAsyncCall: true, child: widget) ;
        }
     return  widget;
      },
    );
  }
}
