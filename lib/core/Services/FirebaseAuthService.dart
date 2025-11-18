import 'dart:math' as _logger;
import 'package:ecommerce_app/Features/Auth/domain/entites/UserEntity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:ecommerce_app/core/errors/CustomExeption.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{


  Future deleteuser()async{
    await FirebaseAuth.instance.currentUser!.delete();
  }
  bool IsLoggedIn(){
    return FirebaseAuth.instance.currentUser !=null;
}

  Future<User>CreateuserwithEmailandPassword({required String email,required String password,required String name})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw CustomException('البريد الإلكتروني غير صالح.');
        case 'user-disabled':
          throw CustomException('هذا الحساب تم تعطيله مؤقتًا.');
        case 'email-already-in-use':
          throw CustomException('هذا البريد الإلكتروني مستخدم بالفعل.');
        case 'weak-password':
          throw CustomException('كلمة المرور التي أدخلتها ضعيفة جدًا.');
        case 'operation-not-allowed':
          throw CustomException('تسجيل المستخدمين بالبريد الإلكتروني غير مفعّل.');
        case 'network-request-failed':
          throw CustomException('خطأ في الاتصال بالشبكة. تحقق من الإنترنت.');
        case 'too-many-requests':
          throw CustomException('عدد محاولات التسجيل كبير جدًا. حاول لاحقًا.');
        case 'internal-error':
          throw CustomException('حدث خطأ داخلي في الخادم.');
        default:
          throw CustomException('حدث خطأ غير متوقع: ${e.code}');
      }
    } catch (e, stackTrace) {
      throw CustomException('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.');
    }
  }
  Future<User>SignInuserwithEmailandPassword({required String email,required String password,required String name})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {

      switch (e.code) {
        case 'invalid-email':
          throw CustomException('البريد الإلكتروني غير صالح.');
        case 'user-disabled':
          throw CustomException('تم تعطيل هذا الحساب مؤقتًا.');
        case 'user-not-found':
          throw CustomException('لا يوجد حساب مرتبط بهذا البريد الإلكتروني.');
        case 'wrong-password':
          throw CustomException('كلمة المرور غير صحيحة.');
        case 'invalid-credential':
          throw CustomException('بيانات الدخول غير صحيحة.');
        case 'network-request-failed':
          throw CustomException('لا يوجد اتصال بالإنترنت.');
        case 'too-many-requests':
          throw CustomException('عدد المحاولات كبير جدًا. حاول لاحقًا.');
        case 'internal-error':
          throw CustomException('حدث خطأ داخلي في الخادم.');
        default:
          throw CustomException('حدث خطأ غير متوقع: ${e.code}');
      }
    } catch (e, stackTrace) {

      throw CustomException('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.');
    }
  }
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    return (await FirebaseAuth.instance.signInWithCredential(credential));
  }



  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
          ;
  }

}

