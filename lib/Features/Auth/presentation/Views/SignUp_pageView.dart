
import 'package:ecommerce_app/Features/Auth/data/repos/AuthRepoImp.dart';
import 'package:ecommerce_app/Features/Auth/manager/Auth-Cubits/SignUpCubit/sign_up_cubit.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/widets/SignUpViewBody_BlocConsumer.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/widets/SignUp_PageViewBody.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:ecommerce_app/core/widgets/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPageview extends StatelessWidget {
  const SignupPageview({Key? key}) : super(key: key);
  static const String routename="signupview";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignUpCubit(getIt<AuthRepoImp>());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        appBar: buildAppBar(context: context,title:  "حساب جديد",showArrowBack: true),
        body: SignUpViewBody_BlocConsumer(),
      ),
    );
  }
}

