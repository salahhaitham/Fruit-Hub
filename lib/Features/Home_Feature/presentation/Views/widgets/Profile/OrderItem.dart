import 'package:ecommerce_app/Features/checkout/data/models/OrderItemModel.dart';
import 'package:ecommerce_app/Features/checkout/data/models/OrderModel.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../../../core/enums/orderenum.dart';
import '../../../../../checkout/domain/entities/OrderEntity.dart';

class Orderitem extends StatelessWidget {
  const Orderitem({Key? key,required this.orderItemModel}) : super(key: key);
final OrderItemModel orderItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 20),
      child: Row(

        children: [
          Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xffEBF9F1),
              shape: BoxShape.circle,
            ),
            child: Center(child: Image.asset("assets/images/orderItem2.png")),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'رقم الطلب :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        orderItemModel.orderId,
                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'تم الطلب :',
                      style: AppTextStyles.body11Regular
                    ),
                    Expanded(
                      child: Text(
                          orderItemModel.orderDate,
                          style: AppTextStyles.body11Regular
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'السعر :',
                        style: AppTextStyles.body11Regular
                    ),
                    Text(
                        orderItemModel.orderPrice.toString(),
                        style: AppTextStyles.body11Regular
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
