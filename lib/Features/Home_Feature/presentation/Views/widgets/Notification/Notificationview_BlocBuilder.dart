

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../manager/Notification_Cubit/notification_cubit.dart';
import 'NotificationViewBody.dart';

class Notificationview_BlocBuilder extends StatelessWidget {
  const Notificationview_BlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit,NotificationState>(
      builder: (context, state) {
        if(state is NotificationSuccess){
          return Notificationviewbody(notificationsList:state.notificationList);
        }
        else if(state is NotificationLoading){
          return ModalProgressHUD(
              inAsyncCall: state is NotificationLoading?true :false,
              child: Notificationviewbody(notificationsList: [],)) ;
        }
       else  if(state is NotificationFailure){
          return Center(child: Text(state.errmessage));
        }
        else return Notificationviewbody(notificationsList: [],);
      },
    );
  }
}
