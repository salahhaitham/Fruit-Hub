
import 'package:dartz/dartz.dart';
import 'dart:io';



import '../../../../core/errors/Failure.dart';


abstract class UploadImageRepo {

  Future<Either<Failure,String>>uploadImage(File fileimage);
}
