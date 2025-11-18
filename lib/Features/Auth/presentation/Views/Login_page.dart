

import 'package:ecommerce_app/Features/Auth/data/repos/AuthRepoImp.dart';
import 'package:ecommerce_app/Features/Auth/manager/Auth-Cubits/SignInCubit/sign_in_cubit.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/widets/SignInPageViewBody.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/widets/SignInPageView_BlocConsumer.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/widgets/ShowSnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/widgets/CustomAppBar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routename="loginpage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignInCubit(getIt<AuthRepoImp>());
      },
      child: Scaffold(
        appBar: buildAppBar(context:context,title: "تسجيل الدخول",),
        body:SignInPageView_BlocConsumer() ,
      ),
    );
  }


}
