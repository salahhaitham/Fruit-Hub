import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepItem.dart';
import 'package:flutter/material.dart';

class Stepslistview extends StatelessWidget {
  const Stepslistview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(getsteps().length, (index) {
        return Expanded(child: Stepitem(text: getsteps()[index], index: index.toString()+1.toString(), isActive: true));
      })
    );

  }
  List<String>getsteps(){
    return ["الشحن","العنوان","الدفع","المراجعة"];
  }
}
