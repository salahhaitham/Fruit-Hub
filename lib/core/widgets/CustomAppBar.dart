import 'package:ecommerce_app/core/widgets/NotificationWidget.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/gen/assets.gen.dart';
import '../utils/App_TextStyles.dart';

AppBar buildAppBar({context, required String title, bool showNotificationIcon=false,bool showArrowBack=false}) {
  return AppBar(
    centerTitle: true,
    title: Text(title,style: AppTextStyles.body19Bold,),
   leading: Icon(Icons.arrow_back_ios),
    actions: [
      Visibility(
        visible:showNotificationIcon ,
        child: IconButton(
          onPressed: () {

          },
          icon:Notification_Widget(),
        ),
      ),
    ],

  );
}