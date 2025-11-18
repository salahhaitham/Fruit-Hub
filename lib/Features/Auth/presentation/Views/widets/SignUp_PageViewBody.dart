import 'package:ecommerce_app/Features/Auth/data/repos/AuthRepoImp.dart';
import 'package:ecommerce_app/Features/Auth/manager/Auth-Cubits/SignUpCubit/sign_up_cubit.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:ecommerce_app/core/widgets/HaveAnAccount_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/App_TextStyles.dart';
import '../../../../../core/utils/Colors.dart';
import '../../../../../core/widgets/TermsAndConditionsWidgets.dart';
import '../SignUp_pageView.dart';

class SignupPageviewbody extends StatefulWidget {
  const SignupPageviewbody({Key? key}) : super(key: key);

  @override
  State<SignupPageviewbody> createState() => _SignupPageviewbodyState();
}

class _SignupPageviewbodyState extends State<SignupPageviewbody> {
  bool isTermsAccecpted = false;
  final GlobalKey<FormState> formvalidator = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formvalidator,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 28),
                CustomTextFormField(
                  hintText: "الاسم كامل",
                  onSaved: (value) {
                    name = value!;
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: "البريد الإلكتروني",
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                  hintText: "كلمة المرور",

                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                const SizedBox(height: 16),

                TermsAndConditionsWidget(
                  value: isTermsAccecpted,
                  onChanged: (value) {
                    setState(() {
                      isTermsAccecpted = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: "إنشاء حساب جديد",
                  onpress: () {
                    if (formvalidator.currentState!.validate()) {
                      formvalidator.currentState!.save();
                      if (isTermsAccecpted) {
                        context
                            .read<SignUpCubit>()
                            .CreateUserWithEmailandPassword(
                              email,
                              password,
                              name,
                            );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("يجب عليك الموافقة علي الشروط والاحكام")));
                      }
                    }
                  },
                ),
                SizedBox(height: 26),
                HaveAnAcoount_Widget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
