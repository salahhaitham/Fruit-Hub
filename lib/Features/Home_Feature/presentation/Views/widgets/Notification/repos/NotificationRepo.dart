import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/NotificationModel.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

abstract class NotificationRepo {
  Future<Either<Failure,List<NotificationModel>>>getNotification();
}