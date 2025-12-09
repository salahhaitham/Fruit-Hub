

import 'package:ecommerce_app/Features/checkout/data/models/OrderItemModel.dart';
import 'package:flutter/material.dart';

import 'Orderslistview.dart';

class Ordersviewbody extends StatelessWidget {
  const Ordersviewbody({Key? key,required this.orders}) : super(key: key);
final List<OrderItemModel>orders;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Orderslistview( orders: orders,)
      ],
    );

  }
}
