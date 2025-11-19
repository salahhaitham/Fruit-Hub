
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutViewBody.dart';
import 'package:flutter/material.dart';

class CheckoutStepsView extends StatelessWidget {
  const CheckoutStepsView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getSteps.length,
        itemBuilder: (context, index) {
          return getSteps[index];
        },
      ),
    );
  }
}
