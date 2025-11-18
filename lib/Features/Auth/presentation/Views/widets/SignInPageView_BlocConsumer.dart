
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/Main_View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/ShowSnackBar.dart';
import '../../../manager/Auth-Cubits/SignInCubit/sign_in_cubit.dart';
import 'SignInPageViewBody.dart';

class SignInPageView_BlocConsumer extends StatelessWidget {
  const SignInPageView_BlocConsumer ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit,SignInState>(
        listener: (context, state) {
          if(state is SignInSuccess){
          Navigator.pushNamed(context, MainView.routename);
          }else if(state is SignInFailure){
            ShowSnackBar(context, state.message);
          }

        },
        builder: (context, state) =>
            ModalProgressHUD(
                inAsyncCall: state is SignInLoading?true:false,
                child: SignInPageViewBody()));
  }
}
