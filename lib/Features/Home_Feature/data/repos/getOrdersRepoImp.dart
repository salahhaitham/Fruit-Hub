import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/repos/getOrdersRepo.dart';
import 'package:ecommerce_app/Features/checkout/data/models/OrderItemModel.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

import '../../../../core/Services/DatabaseServices.dart';

class getOrdersRepoImp extends getOrdersRepo{
  DatabaseServices databaseServices;
  getOrdersRepoImp(this.databaseServices);

  @override
  Stream<Either<Failure, List<OrderItemModel>>> getorders() async* {
    try {
      await for (var result in databaseServices.StreamData(path: "orders")) {
        List<OrderItemModel> orders = (result as List<dynamic>)
            .map((e) => OrderItemModel.fromMap(e))
            .toList();
        yield right(orders);
      }
    } on Exception catch (e) {
      yield left(Serverfailure(e.toString()));
    }
  }

}