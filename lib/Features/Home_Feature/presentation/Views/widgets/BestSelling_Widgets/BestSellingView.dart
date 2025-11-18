
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/widgets/NotificationWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'BestSellingViewBody.dart';

class Bestsellingview extends StatelessWidget {
  const Bestsellingview({Key? key}) : super(key: key);
  static const String routename="bestsellingview";

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(

          centerTitle: true,
          title:  Text(
            'الأكثر مبيعًا',
            style:AppTextStyles.body19Bold
          ),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
          actions: [

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: Notification_Widget(),
           )
          ],

        ),
        body: Bestsellingviewbody(),
      );
  }
}
