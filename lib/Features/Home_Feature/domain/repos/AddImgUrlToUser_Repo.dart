import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

abstract class AddImgUrlToUserRepo{

  Future <Either<Failure,void>>AddImg(String imgUrl);
}