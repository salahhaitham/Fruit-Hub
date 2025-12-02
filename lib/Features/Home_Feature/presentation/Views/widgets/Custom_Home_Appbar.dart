
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/Notification_View.dart';
import 'package:ecommerce_app/core/Helper_Functions/getuser.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/gen/assets.gen.dart';
import '../../../../../core/widgets/NotificationWidget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(

      trailing: GestureDetector(
          onTap: () {
         Navigator.pushNamed(context, NotificationView.routename);
          },
          child: Notification_Widget()),
      leading: Assets.images.profile.image(),


      title:Text(
        'صباح الخير !..',
        style: AppTextStyles.body16Regular.copyWith(color: Color(0xFF949D9E) ),

      ),
      subtitle: Text(
        getUser().UserName,
        textAlign: TextAlign.right,
        style: AppTextStyles.body16Bold.copyWith(color: Color(0xFF0C0D0D))
      ),

    );
  }
}

