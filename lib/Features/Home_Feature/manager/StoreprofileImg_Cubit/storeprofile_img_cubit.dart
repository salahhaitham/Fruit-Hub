import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/repos/AddImgUrlToUser_Repo.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/repos/uploadImageRepo.dart';
import 'package:meta/meta.dart';

import '../../../../../../../../constants.dart';
import '../../../../../../../../core/Services/ShearedPreferenceSinglton.dart';

part 'storeprofile_img_state.dart';

class StoreprofileImgCubit extends Cubit<StoreprofileImgState> {
  StoreprofileImgCubit(this.uploadImageRepo, this.addImgUrlToUserRepo)
    : super(StoreProfileImageInitial());
  AddImgUrlToUserRepo addImgUrlToUserRepo;
  UploadImageRepo uploadImageRepo;

  Future<void> StoreprofileImg(File fileImg) async {
    emit(StoreProfileImageLoading());
    var result = await uploadImageRepo.uploadImage(fileImg);
    result.fold(
      (failure) {
        emit(StoreProfileImageFailure(failure.toString()));
      },
      (imgUrl) async {
        var result = await addImgUrlToUserRepo.AddImg(imgUrl);
        var oldData = SharedPrefernceSinglton.getString(Kuserdata);
        if (oldData != null) {
          Map<String, dynamic> userMap = jsonDecode(oldData);
          userMap["profileImage"] = imgUrl;

          await SharedPrefernceSinglton.setString(
            Kuserdata,
            jsonEncode(userMap),
          );
        }

        result.fold(
          (failure) {
            emit(StoreProfileImageFailure(failure.toString()));
          },
          (success) {
            emit(StoreProfileImageSuccess());
          },
        );
      },
    );
  }
}
