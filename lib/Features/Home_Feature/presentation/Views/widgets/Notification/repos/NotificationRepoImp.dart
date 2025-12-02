import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/NotificationModel.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/repos/NotificationRepo.dart';
import 'package:ecommerce_app/core/Services/DatabaseServices.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

class NotificationRepoImp extends NotificationRepo{
  DatabaseServices databaseServices;
  NotificationRepoImp(this.databaseServices);

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotification() async{
   try {
     var notifications= await databaseServices.getdata(path: "notifications");
     List<NotificationModel>notificationList=(notifications as List <dynamic>).map((e)=>NotificationModel.fromjson(e)).toList();
     return right(notificationList);
   } on Exception catch (e) {
     return left(Serverfailure(e.toString()));
   }


  }

}