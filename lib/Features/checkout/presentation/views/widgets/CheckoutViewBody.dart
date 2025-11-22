import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/ShippingAddressOrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';

import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutStepsView.dart';

import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepsListView.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Checkoutviewbody extends StatefulWidget {
  const Checkoutviewbody({Key? key,required this.cartEntity}) : super(key: key);
final CartEntity cartEntity;
  @override
  State<Checkoutviewbody> createState() => _CheckoutviewbodyState();
}

class _CheckoutviewbodyState extends State<Checkoutviewbody> {
 late PageController pageController;
 GlobalKey<FormState>formkey=GlobalKey();
ValueNotifier<AutovalidateMode>autoValidate=ValueNotifier(AutovalidateMode.disabled);

 int currentIndex=0;
 @override
  void initState() {
   pageController=PageController();
    super.initState();
    pageController.addListener(() {
      currentIndex=pageController.page!.toInt();
      setState(() {

      });
    },);
  }
  @override
  void dispose() {
    pageController.dispose();
    autoValidate.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(

        children: [
          SizedBox(height: 20),
          Stepslistview(currentIndex:currentIndex,pageController: pageController,),
          CheckoutStepsView(pageController: pageController,formKey: formkey,autoValidate: autoValidate,),
          CustomButton(text: getNextBottonText(currentIndex)
            , onpress: () {
              if (currentIndex == 0) {
                checkToShippingSection();
              }else if(currentIndex==1){

          checkToAdressSection();
              }
            },),
          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
        ],
      ),
    );
  }

 String getNextBottonText(int currentIndex ) {
   switch(currentIndex){
     case 0:
       return "التالي";
     case 1:
       return "التالي";
     case 2:
       return "الدفع عبر paybal";
     default:
       return "التالي";
   }

 }
 void checkToAdressSection(){
   bool isValid = formkey.currentState!.validate();

   if (isValid) {

     formkey.currentState!.save();


     pageController.animateToPage(
       currentIndex+1,
       duration: Duration(milliseconds: 300),
       curve: Curves.ease,
     );
   } else {

     autoValidate.value=AutovalidateMode.always;
     showSnackBar(context, "من فضلك أكمل البيانات");
   }
 }
 void checkToShippingSection(){
   if (context.read<OrderEntity>()
       .payWithCash != null) {

     pageController.animateToPage(
         currentIndex + 1, duration: Duration(milliseconds: 300),
         curve: Curves.easeIn);
   } else {
     showSnackBar(context, "برجاء اختيار طريقة الدفع ");
   }
 }
 }


