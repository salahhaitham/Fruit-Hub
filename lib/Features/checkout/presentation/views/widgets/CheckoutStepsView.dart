
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/Adress_Section.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutViewBody.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/Payment_Section.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ShippingSection.dart';
import 'package:flutter/material.dart';

class CheckoutStepsView extends StatelessWidget {
   CheckoutStepsView({
    super.key,
    required this.pageController,
    required this.formKey,required this.autoValidate

  });
   GlobalKey<FormState>formKey;
ValueNotifier<AutovalidateMode>autoValidate;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getSteps().length,
        itemBuilder: (context, index) {
          return getSteps()[index];
        },
      ),
    );

  }
   List<Widget> getSteps() {
     return [
       Shippingsection(),
       AddressSection(formKey: formKey,autoValidate: autoValidate,),
       PaymentSection(),
     ];
   }


}
