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
      listener: (context, state) {
        if(state is OrdersSuccess) {
          showSnackBar(context, "تمت العملية بنجاح");
        }
      },

      builder: (context, state) {


     return  widget;
      },
    );
  }
}
