import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepItem.dart';
import 'package:flutter/material.dart';

class Stepslistview extends StatelessWidget {
  const Stepslistview({Key? key, required this.currentIndex, required this.pageController}) : super(key: key);

  final PageController pageController;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(getsteps().length, (index) {
        return GestureDetector(
            onTap: () {
              pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve:Curves.easeIn);
            },
            child: Stepitem(text: getsteps()[index], index: (index+1).toString(), isActive: index<=currentIndex));
      })
    );

  }
  List<String>getsteps(){
    return ["الشحن","العنوان","الدفع"];
  }
}
