import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/Auth/domain/entites/UserEntity.dart';
import 'package:ecommerce_app/Features/Auth/domain/models/UserModel.dart';
import 'package:ecommerce_app/Features/Auth/domain/repos/AuthRepo.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/Services/Backend_EndPoints.dart';
import 'package:ecommerce_app/core/Services/DatabaseServices.dart';
import 'package:ecommerce_app/core/Services/FirebaseAuthService.dart';
import 'package:ecommerce_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:ecommerce_app/core/errors/CustomExeption.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImp extends AuthRepo {
  FirebaseAuthService firebaseAuthService;
  DatabaseServices databaseServices;

  AuthRepoImp(this.firebaseAuthService, this.databaseServices);

  @override
  Future<Either<Failure, UserEntity>> CreateUserWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.CreateuserwithEmailandPassword(
        email: email,
        password: password,
        name: username,
      );
      var userentity = UserEntity(
        email: email,
        Uid: user.uid,
        UserName: username,
      );

      await AddUserData(user: userentity);
      return right(userentity);
    } on CustomException catch (e) {
      return left(Serverfailure(e.message));
    } on Exception catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteuser();
      }
      return Left(Serverfailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> SignInUserWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    try {
      var user = await firebaseAuthService.SignInuserwithEmailandPassword(
        email: email,
        password: password,
        name: username,

      );
      var userdata = await getUserData(userid: user.uid);
      SaveUserData(user: userdata);
      return right(UserModel.fromfirebaseAuth(user));
    } on CustomException catch (e) {
      return left(Serverfailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> SignInWithGoogle() async {
    User? user;
    try {
      var userCredintial = await firebaseAuthService.signInWithGoogle();
      user = userCredintial.user;
      var userentity = UserModel.fromfirebaseAuth(user!);

      var ischecked=  await databaseServices.CheckIfhasData(path: Backend_EndPoints.getusersdata, ducomentid: user.uid);
      if(ischecked){
        var userdata = await getUserData(userid: user.uid);
      }else{
        await AddUserData(user: userentity);
      }
    return right(userentity);
    } catch (e) {
      if (user != null){
        await firebaseAuthService.deleteuser();

      }
      log(e.toString());

      return Left(Serverfailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> SignInWithFacebook() async {
    User? user;
    try {
      var usercredintial = await firebaseAuthService.signInWithFacebook();
      var user = usercredintial.user;
      var userentity = UserModel.fromfirebaseAuth(user!);
      var ischecked=  await databaseServices.CheckIfhasData(path: Backend_EndPoints.getusersdata, ducomentid: user.uid);
      if(ischecked){
        var userdata = await getUserData(userid: user.uid);

      }else{
        await AddUserData(user: userentity);
      }

      return right(userentity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteuser();
      }
      log(e.toString());
      return Left(Serverfailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.'));
    }
  }

  @override
  Future<void> AddUserData({required UserEntity user}) async {
    await databaseServices.adddata(
      collection: Backend_EndPoints.Userscollection,
      data:UserModel.fromuserentity(user).ToMab(),
      documentid: user.Uid,
    );
  }

  @override
  Future<UserEntity> getUserData({required String userid}) async {
    var userdata = await databaseServices.getdata(
      path: Backend_EndPoints.getusersdata,
      documentid: userid,
    );
    return UserModel.fromjson(userdata);
  }

  @override
  Future<void> SaveUserData({required UserEntity user}) async{
   var userdata= jsonEncode(UserModel.fromuserentity(user).ToMab());
   await SharedPrefernceSinglton.setString(Kuserdata, userdata);
  }


}
