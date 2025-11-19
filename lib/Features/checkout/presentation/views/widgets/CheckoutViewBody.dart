import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ActiveStepView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/Adress_Section.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutStepsView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/InActiveStepView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/Payment_Section.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ShippingSection.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepsListView.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/cupertino.dart';

class Checkoutviewbody extends StatefulWidget {
  const Checkoutviewbody({Key? key}) : super(key: key);

  @override
  State<Checkoutviewbody> createState() => _CheckoutviewbodyState();
}

class _CheckoutviewbodyState extends State<Checkoutviewbody> {
 late PageController pageController;
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
          CheckoutStepsView(pageController: pageController),
          CustomButton(text: getNextBottonText(currentIndex)
            , onpress: () {
            pageController.animateToPage(currentIndex+1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
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
}


List<Widget>getSteps=[
  Shippingsection(),
  AddressSection(),
  PaymentSection()

];