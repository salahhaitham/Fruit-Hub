
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSection extends StatelessWidget {
   AddressSection({Key? key,required this.formKey,required this.autoValidate}) : super(key: key);
final GlobalKey<FormState>formKey;
ValueNotifier<AutovalidateMode>autoValidate;
  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: autoValidate,
      builder: (context, value, child) =>  Form(
        key: formKey,
      autovalidateMode: value,
        child: Column(
            children: [
             SizedBox(height: 25,),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().addressEntity!.name=value!;
                },
                hintText:'الاسم كامل',),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().addressEntity!.email=value!;
                },
                hintText:'البريد الالكتروني',),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().addressEntity!.adress=value!;
                },
                hintText:'العنوان',),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().addressEntity!.city=value!;
                },
                hintText:'المدينة',),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().addressEntity!.floorNumber=value!;
                },
                hintText:'رقم الطابق.رقم الشقة..',),
              SizedBox(height: 8,),

            ],

        ),
      ),
    );
  }
}
