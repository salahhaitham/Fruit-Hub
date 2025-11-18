import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ActiveStepView.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/InActiveStepView.dart';
import 'package:flutter/material.dart';

class Stepitem extends StatelessWidget {
  const Stepitem({Key? key, required this.text, required this.index, required this.isActive})
    : super(key: key);
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Inactivestepview(index: index, text: text),
      secondChild: Activestepview(text: text),
      crossFadeState: isActive ?CrossFadeState.showSecond :CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}
