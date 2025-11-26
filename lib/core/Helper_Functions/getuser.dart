import 'dart:convert';

import 'package:ecommerce_app/Features/Auth/domain/entites/UserEntity.dart';
import 'package:ecommerce_app/Features/Auth/domain/models/UserModel.dart';

import '../../constants.dart';
import '../Services/ShearedPreferenceSinglton.dart';



  UserEntity getUser(){

      var userdata = SharedPrefernceSinglton.getString(Kuserdata);
    if( userdata ==null){return UserEntity(email: "", Uid: "", UserName: "salah");}
      var userentity=UserModel.fromjson(jsonDecode(userdata));
      return userentity;
    }

