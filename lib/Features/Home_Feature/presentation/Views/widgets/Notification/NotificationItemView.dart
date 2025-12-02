import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/NotificationModel.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class NotificationItemView extends StatelessWidget {
  const NotificationItemView({Key? key, required this.notificationModel}) : super(key: key);
final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.asset(
            "assets/images/OIP.webp",
            fit: BoxFit.fill,
            width: 65,
            height: 65,
          ),
        ),

        SizedBox(width: 12),

        // الجزء اللي فيه النص + التاريخ
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row جوه Expanded علشان التاريخ يفضل ثابت في نفس السطر
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // النص
                  Expanded(
                    child: Text(
                      notificationModel.NotificationText,
                      style: AppTextStyles.body16Regular,
                      maxLines: null, // يسمح ينزل تحت
                    ),
                  ),

                  SizedBox(width: 8),

                  // التاريخ ثابت
                  Text(
                    notificationModel.notificationDate,
                    style: AppTextStyles.body11Regular,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );


  }
}
