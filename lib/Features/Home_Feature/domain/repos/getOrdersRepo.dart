import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/checkout/data/models/OrderItemModel.dart';

import '../../../../core/errors/Failure.dart';
import '../../../checkout/domain/entities/OrderEntity.dart';

abstract class getOrdersRepo{

  Stream <Either<Failure, List<OrderItemModel>>> getorders();
}