
import 'package:flutter/material.dart';

import '../../../../../checkout/data/models/OrderItemModel.dart';
import '../../../../../checkout/domain/entities/OrderEntity.dart';
import 'OrderItem.dart';

class Orderslistview extends StatelessWidget {
  const Orderslistview({Key? key,required this.orders}) : super(key: key);
  final List<OrderItemModel>orders;
  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Orderitem( orderItemModel: orders[index],);
        },
        childCount: orders.length,
      ),
    );
  }
}