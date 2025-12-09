import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/NotificationModel.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/repos/NotificationRepo.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepo) : super(NotificationInitial());

  NotificationRepo notificationRepo;
  Future<void>getNotification()async{
    emit( NotificationLoading());
  var result=   await notificationRepo.getNotification();
  result.fold(
          (failure){
             emit(NotificationFailure(failure.errormessage));
            }, (notificationsList){
             emit(NotificationSuccess(notificationList: notificationsList));

           });
  }
}
