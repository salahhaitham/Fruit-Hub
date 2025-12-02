import 'dart:io';

import 'package:ecommerce_app/Features/Auth/manager/Auth-Cubits/SignInCubit/sign_in_cubit.dart';
import 'package:ecommerce_app/Features/Auth/presentation/Views/widets/ResetPasswordView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/Main_View.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/gen/assets.gen.dart';

import '../../../../../core/widgets/CustomTextFormField.dart';
import '../../../../../core/widgets/DontHaveAnAccount_Widget.dart';
import '../../../../../core/widgets/SocialTextButton.dart';

class SignInPageViewBody extends StatefulWidget {
  const SignInPageViewBody({Key? key}) : super(key: key);

  @override
  State<SignInPageViewBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<SignInPageViewBody> {
  final GlobalKey<FormState> formvalidator = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formvalidator,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: "البريد الإلكتروني",

                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                onSaved: (value) {
                  password = value!;
                },
                hintText: "كلمة المرور",
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPasswordScreen.routename);
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: AppTextStyles.heading13semiBold.copyWith(
                        color: Color(0xFF2D9F5D),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              CustomButton(
                text: "تسجيل دخول",
                onpress: () {

                  if (formvalidator.currentState!.validate()) {
                    formvalidator.currentState!.save();
                    context.read<SignInCubit>().SigninUserWithEmailandPassword(
                      email,
                      password,
                      "username",
                    );
                  }
                },
              ),
              SizedBox(height: 33),

              DontHaveAnAcoount_Widget(),
              SizedBox(height: 37),

              Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 17),
                  Text("أو", style: AppTextStyles.heading16semiBold),
                  SizedBox(width: 17),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),
              SocialTextButton(
                onpress: () {
                  context.read<SignInCubit>().SigninUserWithGoogleAccount();
                },

                title: "تسجيل بواسطة جوجل",
                image: Assets.images.googleIcon,
              ),
              SizedBox(height: 16),

              Platform.isIOS
                  ? Column(
                      children: [
                        SocialTextButton(
                          onpress: () {},
                          title: "تسجيل بواسطة أبل",
                          image: Assets.images.appleIcon,
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                  : SizedBox(),

              SocialTextButton(
                onpress: () {
                  context.read<SignInCubit>().SigninUserWithFacebook();
                },
                title: "تسجيل بواسطة فيسبوك",
                image: Assets.images.facebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
