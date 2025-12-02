
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/NotificationItemView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/NotificationModel.dart';
import 'package:ecommerce_app/core/widgets/NotificationWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/App_TextStyles.dart';
import '../../../../../../core/utils/gen/assets.gen.dart';
import '../../../../../../core/widgets/NotificationView_Appbar.dart';

class Notificationviewbody extends StatelessWidget {
  const Notificationviewbody ({Key? key, required this.notificationsList}) : super(key: key);
final List<NotificationModel>notificationsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(children: [
        NotificationView_Appbar(),
        Expanded(
          child: ListView.builder(
            itemCount: notificationsList.length,
            itemBuilder: (context, index) {
           return Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
             child: NotificationItemView(notificationModel: notificationsList[index],),
           );
          },),
        ),


        ],),
      ),
    );
  }
}

