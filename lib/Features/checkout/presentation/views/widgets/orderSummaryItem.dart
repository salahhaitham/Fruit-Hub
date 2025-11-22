import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/Payment_Item.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class orderSummaryItem extends StatelessWidget {
  const orderSummaryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      text: 'ملخص الطلب :',
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 15),
        child: Column(
          children: [

            Row(
              children: [
                Text(
                  'المجموع الفرعي :',
                  style: AppTextStyles.body13Regular.copyWith(
                    color: App_colors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  '${context.read<OrderEntity>().cartEntity.CaluculateTotalPrice()} جنيه',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.heading16semiBold,
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text(
                  'التوصيل  :',
                  style: AppTextStyles.body13Regular.copyWith(
                    color: App_colors.grey,
                  ),
                ),
                Spacer(),
                Text(
                    '30جنية',
                    textAlign: TextAlign.right,
                    style:AppTextStyles.heading13semiBold.copyWith(color: App_colors.grey)
                ),

              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 9,horizontal: 32),
              child: Divider(
                color: Color(0xffE6E9E9),
                thickness: 2,

              ),
            ),
            Row(
              children: [
                Text(
                  'الكلي',
                  style: AppTextStyles.body16Bold.copyWith(
                    color: App_colors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  '${context.read<OrderEntity>().cartEntity.CaluculateTotalPrice()+30} جنيه',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.body16Bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
