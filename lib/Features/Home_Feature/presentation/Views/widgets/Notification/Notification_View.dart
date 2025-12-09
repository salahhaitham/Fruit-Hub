
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/NotificationViewBody.dart';
import 'package:ecommerce_app/Features/Home_Feature/data/repos/NotificationRepoImp.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../manager/Notification_Cubit/notification_cubit.dart';
import 'Notificationview_BlocBuilder.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);
 static const routename="notificationview";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return NotificationCubit(getIt.get<NotificationRepoImp>())..getNotification();
        },

        child: Notificationview_BlocBuilder());
  }
}

