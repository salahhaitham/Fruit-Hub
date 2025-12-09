import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/repos/AddImgUrlToUser_Repo.dart';
import 'package:ecommerce_app/core/Helper_Functions/getuser.dart';
import 'package:ecommerce_app/core/Services/Backend_EndPoints.dart';
import 'package:ecommerce_app/core/Services/FireStoreServices.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

class AddImgUrlToUser_RepoImp extends AddImgUrlToUserRepo {
  FireStoreservices fireStoreservices;
  AddImgUrlToUser_RepoImp(this.fireStoreservices);
  @override
  Future<Either<Failure, void>>AddImg(String imgUrl) async {
    try {
      var result = await fireStoreservices.updateData(
        path: Backend_EndPoints.getusersdata,
        documentid: getUser().Uid,
        data: {"profileImage": imgUrl},
      );
      return right(unit);
    } on Exception catch (e) {
     return left(Serverfailure(e.toString()));
    }

  }
}
