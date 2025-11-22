import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

abstract class OrdersRepo{

  Future<Either<Failure,void>>addOrder(OrderEntity order);

}