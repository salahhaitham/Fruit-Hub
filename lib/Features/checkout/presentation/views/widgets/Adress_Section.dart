
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSection extends StatefulWidget {
   AddressSection({Key? key,required this.formKey,required this.autoValidate}) : super(key: key);
final GlobalKey<FormState>formKey;
ValueNotifier<AutovalidateMode>autoValidate;

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: widget.autoValidate,
      builder: (context, value, child) =>  Form(
        key: widget.formKey,
      autovalidateMode: value,
        child: SingleChildScrollView(
          child: Column(
              children: [
               SizedBox(height: 25,),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressOrderEntity!.name=value!;
                  },
                  hintText:'الاسم كامل',),
                SizedBox(height: 8,),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressOrderEntity!.email=value!;
                  },
                  hintText:'البريد الالكتروني',),
                SizedBox(height: 8,),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressOrderEntity!.address=value!;
                  },
                  hintText:'العنوان',),
                SizedBox(height: 8,),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressOrderEntity!.city=value!;
                  },
                  hintText:'المدينة',),
                SizedBox(height: 8,),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressOrderEntity!.floorNumber=value!;
                  },
                  hintText:'رقم الطابق.رقم الشقة..',),
                SizedBox(height: 8,),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressOrderEntity!.phoneNumber=value!;
                  },
                  hintText:'رقم الهاتق',),

                SizedBox(height: 8,),

              ],

          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
