import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/Auth/domain/entites/UserEntity.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserEntity>>CreateUserWithEmailAndPassword(String email,String password,String username);
  Future<Either<Failure,UserEntity>>SignInUserWithEmailAndPassword(String email,String password,String username);
  Future<Either<Failure,UserEntity>>SignInWithGoogle();
  Future<Either<Failure,UserEntity>>SignInWithFacebook();
  Future<void>AddUserData({required UserEntity user});
  Future<UserEntity>getUserData({required String userid});
  Future<void>SaveUserData({required UserEntity user});




}