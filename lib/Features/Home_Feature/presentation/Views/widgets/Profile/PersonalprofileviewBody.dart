import 'package:ecommerce_app/core/Helper_Functions/getuser.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/gen/assets.gen.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import 'Personal_Info_Container.dart';

class Personalprofileviewbody extends StatefulWidget {
  const Personalprofileviewbody({Key? key}) : super(key: key);

  @override
  State<Personalprofileviewbody> createState() => _PersonalprofileviewbodyState();
}

class _PersonalprofileviewbodyState extends State<Personalprofileviewbody> {
  GlobalKey<FormState>formKey = GlobalKey();
  late String currentPassword, newPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28),

              Row(
                children: [
                  Text('المعلومات الشخصيه',
                      style: AppTextStyles.heading13semiBold),
                ],
              ),
              SizedBox(height: 8),
              Personal_Info_Container(
                peresonalText: getUser().UserName,

              ),
              SizedBox(height: 8),
              Personal_Info_Container(
                peresonalText: getUser().email,

              ),
              SizedBox(height: 18),
              Text('تغيير كلمة المرور', style: AppTextStyles.heading13semiBold),
              SizedBox(height: 8,),
              CustomTextFormField(
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                hintText: "كلمة المرور الحالي ",
                onSaved: (value) {
                  currentPassword = value!;
                },
              ),
              SizedBox(height: 8,),
              CustomTextFormField(
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                hintText: "كلمة المرور الجديدة ",
                onSaved: (value) {
                  newPassword = value!;
                },
              ),
              SizedBox(height: 8,),
              CustomTextFormField(

                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                hintText: "تأكيد كلمة المرور الجديدة ",
                onSaved: (value) {
                  newPassword = value!;
                },
              ),
              SizedBox(height: 38,),
              CustomButton(text: "حفظ التغييرات ", onpress: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  try {
                    await updateUserPassword(
                      currentPassword: currentPassword,
                      newPassword: newPassword,
                    );
                    formKey.currentState!.reset();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("تم تغيير كلمة المرور بنجاح")),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("خطأ: ${e.toString()}")),
                    );
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {

                  });
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateUserPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;

      // Step 1: إعادة تسجيل الدخول
      final cred = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(cred);

      // Step 2: تحديث كلمة المرور
      await user.updatePassword(newPassword);
    } catch (e) {
      if (e is FirebaseAuthException) {

        if (e.code == "invalid-credential") {
          throw "كلمة المرور الحالية غير صحيحة";
        }

        if (e.code == "weak-password") {
          throw "كلمة المرور الجديدة ضعيفة جدًا";
        }

        if (e.code == "requires-recent-login") {
          throw "يجب تسجيل الدخول مرة أخرى لأسباب أمنية";
        }

        throw "حدث خطأ غير متوقع";
      }
    }
  }
}
