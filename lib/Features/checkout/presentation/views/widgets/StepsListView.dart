import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepItem.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Stepslistview extends StatelessWidget {
  const Stepslistview({Key? key, required this.currentIndex, required this.pageController, required this.ontap}) : super(key: key);

  final PageController pageController;
  final int currentIndex;
  final ValueChanged ontap;
  @override
  Widget build(BuildContext context) {
    return Row(

      children: List.generate(getsteps().length, (index) {
        return Expanded(
          child: GestureDetector(
              onTap: () {
ontap(index);

                },
              child: Stepitem(text: getsteps()[index], index: (index+1).toString(), isActive: index<=currentIndex)),
        );
      })
    );

  }
  List<String>getsteps(){
    return ["الشحن","العنوان","الدفع"];
  }
}
