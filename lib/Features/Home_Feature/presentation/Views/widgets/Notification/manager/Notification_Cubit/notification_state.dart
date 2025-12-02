part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}
final class NotificationLoading extends NotificationState {}

final class NotificationFailure extends NotificationState {
  final String errmessage;
  NotificationFailure(this.errmessage);
}

final class NotificationSuccess extends NotificationState {
  List<NotificationModel>notificationList;
  NotificationSuccess({required this.notificationList});

}

