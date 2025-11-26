import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/PaypalPaymentEntity.dart';
import 'package:ecommerce_app/Features/checkout/manager/orders/orders_cubit.dart';

import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutStepsView.dart';

import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepsListView.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:ecommerce_app/core/utils/AppKeys.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class Checkoutviewbody extends StatefulWidget {
  const Checkoutviewbody({Key? key, required this.cartEntity})
    : super(key: key);
  final CartEntity cartEntity;
  @override
  State<Checkoutviewbody> createState() => _CheckoutviewbodyState();
}

class _CheckoutviewbodyState extends State<Checkoutviewbody> {
  late PageController pageController;
  GlobalKey<FormState> formkey = GlobalKey();
  ValueNotifier<AutovalidateMode> autoValidate = ValueNotifier(
    AutovalidateMode.disabled,
  );

  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page!.toInt();
      setState(() {});
    });
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
          Stepslistview(
            currentIndex: currentIndex,
            pageController: pageController,
            ontap: (index) {
              if (index == 0) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else if (index == 1) {
                if (context.read<OrderEntity>().payWithCash != null) {
                  pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  showSnackBar(context, "يرجي تحديد طريقة الدفعa ");
                }
              } else
                checkToAdressSection();
            },
          ),
          CheckoutStepsView(
            pageController: pageController,
            formKey: formkey,
            autoValidate: autoValidate,
          ),
          CustomButton(
            text: getNextBottonText(currentIndex),
            onpress: () {
              if (currentIndex == 0) {
                checkToShippingSection();
              } else if (currentIndex == 1) {
                checkToAdressSection();
              } else if (currentIndex == 2) {
                startProcessPayment();
              }
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        ],
      ),
    );
  }

  String getNextBottonText(int currentIndex) {
    switch (currentIndex) {
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

  void checkToAdressSection() {
    bool isValid = formkey.currentState!.validate();

    if (isValid) {
      formkey.currentState!.save();

      pageController.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      autoValidate.value = AutovalidateMode.always;
      showSnackBar(context, "من فضلك أكمل البيانات");
    }
  }

  void checkToShippingSection() {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      showSnackBar(context, "برجاء اختيار طريقة الدفع ");
    }
  }

  void startProcessPayment() {
    var crtEntity = context.read<OrderEntity>().cartEntity;
    var orderentity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      crtEntity,
    );
    var order = context.read<OrdersCubit>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId:
              "ARbUbQW3uMpbKkhHgLHLZUd_O8Jl-X7zvW6GbmDKaPLK00-P9XBay8i4V67Ph8CyrRIjhep9NUSEONI3",
          secretKey:
              "EASmWj8XwZeKW9xEXacgXu9U4tZa5I5FbPvBpbLlhoYQfbwwYcfPqXMSia_BOHemKz93JKHbvOA8gXB3",
          transactions: [paypalPaymentEntity.tojson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            Navigator.pop(context);
            order.addOrder(orderentity);
          },
          onError: (error) {
            showSnackBar(context, "حدث خطأ: $error");
            print("حدث خطأ: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }
}
