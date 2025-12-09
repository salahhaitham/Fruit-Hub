import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../../../constants.dart';
import '../../../../core/Services/Storage-Service.dart';
import '../../../../core/errors/Failure.dart';
import '../../domain/repos/uploadImageRepo.dart';

class UploadImageRepoImpl extends UploadImageRepo {
  StoragService storagService;
  UploadImageRepoImpl(this.storagService);

  @override
  Future<Either<Failure, String>> uploadImage(File fileimage) async {
    try {
      String url = await storagService.UploadFile(fileimage, Kprofileimages);
      return right(url);
    } on Exception catch (e) {
      return left(Serverfailure(e.toString()));
    }
  }
}
