
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ActiveStepView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/InActiveStepView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepsListView.dart';
import 'package:flutter/cupertino.dart';

class Checkoutviewbody extends StatelessWidget {
  const Checkoutviewbody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
            Stepslistview(),
        ],
      ),
    );
  }
}
