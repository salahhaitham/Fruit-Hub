
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutViewBody.dart';
import 'package:ecommerce_app/core/widgets/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checkoutview extends StatelessWidget {
  const Checkoutview({Key? key}) : super(key: key);
static const String routename='checkoutview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "الشحن",showArrowBack: false),
      body: Checkoutviewbody(),
    );
  }
}
