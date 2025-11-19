
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
          children: [
           SizedBox(height: 25,),
            CustomTextFormField(hintText:'الاسم كامل',),
            SizedBox(height: 8,),
            CustomTextFormField(hintText:'البريد الالكتروني',),
            SizedBox(height: 8,),
            CustomTextFormField(hintText:'العنوان',),
            SizedBox(height: 8,),
            CustomTextFormField(hintText:'المدينة',),
            SizedBox(height: 8,),
            CustomTextFormField(hintText:'رقم الطابق.رقم الشقة..',),
            SizedBox(height: 8,),
        
          ],
      
      ),
    );
  }
}
