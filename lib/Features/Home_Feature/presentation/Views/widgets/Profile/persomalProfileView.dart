
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/PersonalprofileviewBody.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/material.dart';

class Personalprofileview extends StatelessWidget {
  const Personalprofileview({Key? key}) : super(key: key);

  static const routename="personalprofileview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'الملف الشخصي',
          style: AppTextStyles.body19Bold
        ),
        centerTitle: true,

        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_rounded)
        ),
      ),

      body: Personalprofileviewbody(),
    );

  }
}
