import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/ShowSnackBar.dart';
import '../../../manager/Auth-Cubits/SignUpCubit/sign_up_cubit.dart';
import 'SignUp_PageViewBody.dart';

class SignUpViewBody_BlocConsumer extends StatelessWidget {
  const SignUpViewBody_BlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit,SignUpState>(
        listener: (context, state) {
          if(state is SignUpSucces){
            Navigator.pop(context);
          }        if(state is SignUpFailure){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }

        },
        builder: (context, state) =>
            ModalProgressHUD(
                inAsyncCall: state is SignUpLoading ?true :false,
                child: SignupPageviewbody()));
  }

}

