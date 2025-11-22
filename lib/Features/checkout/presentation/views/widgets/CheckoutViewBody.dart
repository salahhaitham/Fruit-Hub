import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';

import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutStepsView.dart';

import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/StepsListView.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class Checkoutviewbody extends StatefulWidget {
  const Checkoutviewbody({Key? key,required this.cartEntity}) : super(key: key);
final CartEntity cartEntity;
  @override
  State<Checkoutviewbody> createState() => _CheckoutviewbodyState();
}

class _CheckoutviewbodyState extends State<Checkoutviewbody> {
  late PageController pageController;
  GlobalKey<FormState>formkey = GlobalKey();
  ValueNotifier<AutovalidateMode>autoValidate = ValueNotifier(
      AutovalidateMode.disabled);

  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page!.toInt();
      setState(() {

      });
    },);
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
            currentIndex: currentIndex, pageController: pageController,),
          CheckoutStepsView(pageController: pageController,
            formKey: formkey,
            autoValidate: autoValidate,),
          CustomButton(text: getNextBottonText(currentIndex)
            , onpress: () {
              if (currentIndex == 0) {
                checkToShippingSection();
              } else if (currentIndex == 1) {
                checkToAdressSection();
              }
              else if (currentIndex == 2) {
                startProcessPayment();
              }
            },),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.2,),
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
    if (context
        .read<OrderEntity>()
        .payWithCash != null) {
      pageController.animateToPage(
          currentIndex + 1, duration: Duration(milliseconds: 300),
          curve: Curves.easeIn);
    } else {
      showSnackBar(context, "برجاء اختيار طريقة الدفع ");
    }
  }

  void startProcessPayment() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) =>
          PaypalCheckoutView(
            sandboxMode: true,
            clientId: "",
            secretKey: "",
            transactions: const [
              {
                "amount": {
                  "total": '70',
                  "currency": "USD",
                  "details": {
                    "subtotal": '70',
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                // "payment_options": {
                //   "allowed_payment_method":
                //       "INSTANT_FUNDING_SOURCE"
                // },
                "item_list": {
                  "items": [
                    {
                      "name": "Apple",
                      "quantity": 4,
                      "price": '5',
                      "currency": "USD"
                    },
                    {
                      "name": "Pineapple",
                      "quantity": 5,
                      "price": '10',
                      "currency": "USD"
                    }
                  ],

                  // shipping address is not required though
                  //   "shipping_address": {
                  //     "recipient_name": "tharwat",
                  //     "line1": "Alexandria",
                  //     "line2": "",
                  //     "city": "Alexandria",
                  //     "country_code": "EG",
                  //     "postal_code": "21505",
                  //     "phone": "+00000000",
                  //     "state": "Alexandria"
                  //  },
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              print("onSuccess: $params");
            },
            onError: (error) {
              print("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              print('cancelled:');
            },
          ),
    ));
  }


}
