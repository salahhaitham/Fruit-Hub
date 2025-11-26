import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/checkout/data/models/OrderModel.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/core/Services/Backend_EndPoints.dart';
import 'package:ecommerce_app/core/Services/DatabaseServices.dart';
import 'package:ecommerce_app/core/Services/FireStoreServices.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';
import 'package:ecommerce_app/core/repos/orders/OredersRepo.dart';

class OrdersRepoImpl extends OrdersRepo {
  DatabaseServices databaseServices;

  OrdersRepoImpl(this.databaseServices);

  @override
  Future<Either<Failure, void>> addOrder(OrderEntity order) async {
    try {
      var orderModel = OrderModel.fromOrderEntity(order);
      await databaseServices.adddata(
        collection: Backend_EndPoints.Koreders,
        documentid: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return right(null);
    } on Exception catch (e) {
      return Left(Serverfailure(e.toString()));
    }
  }
}
