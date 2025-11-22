import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/Payment_Item.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/orderSummaryItem.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24,),
        orderSummaryItem(),
        PaymentItem(text: "",
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              child: Column(
                        children: [
              Row(children: [
                Text(
                  'عنوان التوصيل',
                  style: AppTextStyles.body13Bold
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.edit,),
                    Text(
                      'تعديل',
                      style:AppTextStyles.heading13semiBold
                    )
                  ],
                )
              ],),
                       SizedBox(height: 8,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.locationDot),
                              Text(
                                  context.read<OrderEntity>().shippingAddressOrderEntity.toString(),
                                textAlign: TextAlign.right,
                                style: AppTextStyles.body16Regular
                              )
                            ],
                          )
                        ],
                      ),
            ))
      ],
    );
  }
}

