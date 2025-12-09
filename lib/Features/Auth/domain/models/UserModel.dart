import 'package:ecommerce_app/Features/Auth/domain/entites/UserEntity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.Uid,
    required super.UserName,
     super.profileImg
  });

  factory UserModel.fromfirebaseAuth(User user) {
    return UserModel(
      email: user.email ?? "",
      Uid: user.uid ?? "",
      UserName: user.displayName ?? "",

    );
  }
  factory UserModel.fromjson(Map<String,dynamic>json) {
    return UserModel(
      email:json['email']??"",
      Uid:json['Uid']??"",
      UserName:json['name']??"",
      profileImg: json["profileImage"]

    );
  }
  factory UserModel.fromuserentity(UserEntity user) {
    return UserModel(
      email:user.email,
      Uid:user.Uid,
      UserName:user.UserName,
      profileImg: user.profileImg
    );
  }
  ToMab(){
    return
      {
        'name':UserName,
        'email':email,
        'Uid':Uid,
        "profileImage": profileImg
      };
  }

}
