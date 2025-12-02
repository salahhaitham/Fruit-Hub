
import 'package:flutter/material.dart';

import '../utils/App_TextStyles.dart';
import 'NotificationWidget.dart';

class NotificationView_Appbar extends StatelessWidget {
  const NotificationView_Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(

      trailing: Notification_Widget(),
      leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios)),


      title:Center(
        child: Text(

            'الاشعارات',
            style: AppTextStyles.body19Bold ),

      ),
    );
  }
}
