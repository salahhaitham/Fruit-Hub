import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

abstract class ProductRepo{
  Future<Either<Failure,List<ProductEntity>>>getproducts();
  Future<Either<Failure,List<ProductEntity>>>getBestSellingProducts();
}