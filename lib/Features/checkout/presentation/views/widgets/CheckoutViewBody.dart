import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ActiveStepView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutStepsView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/InActiveStepView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ShippingSection.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepsListView.dart';
import 'package:flutter/cupertino.dart';

class Checkoutviewbody extends StatefulWidget {
  const Checkoutviewbody({Key? key}) : super(key: key);

  @override
  State<Checkoutviewbody> createState() => _CheckoutviewbodyState();
}

class _CheckoutviewbodyState extends State<Checkoutviewbody> {
 late PageController pageController;

 @override
  void initState() {
   pageController=PageController();
    super.initState();
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
          Stepslistview(),
          CheckoutStepsView(pageController: pageController),
        ],
      ),
    );
  }
}


List<Widget>getSteps=[
  Shippingsection(),
  SizedBox(),
  SizedBox(),
  SizedBox()
];