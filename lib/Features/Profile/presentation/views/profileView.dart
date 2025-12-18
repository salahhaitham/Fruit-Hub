
import 'package:ecommerce_app/Features/Home_Feature/data/repos/AddImgUrlToUser_RepoImp.dart';
import 'package:ecommerce_app/Features/Home_Feature/data/repos/uploadImageRepoImpl.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/ProfileViewBody.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/StoreprofileImg_Cubit/storeprofile_img_cubit.dart';

class Profileview extends StatelessWidget {
  const Profileview({Key? key}) : super(key: key);
  static const routename="profileview";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return StoreprofileImgCubit(getIt.get<UploadImageRepoImpl>(), getIt.get<AddImgUrlToUser_RepoImp>());
        },
        child: ProfileViewBody());
  }
}
