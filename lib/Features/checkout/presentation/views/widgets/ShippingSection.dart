import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ShipItem.dart';
import 'package:flutter/material.dart';

class Shippingsection extends StatefulWidget {
  const Shippingsection({Key? key}) : super(key: key);

  @override
  State<Shippingsection> createState() => _ShippingsectionState();
}

class _ShippingsectionState extends State<Shippingsection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Shipitem(
          onaTap: () {

            setState(() {
              selectedIndex=0;
            });
          },
          title: "الدفع عند الاستلام",
          subTitle: "التسليم من المكان",
          price: 40,
          isSelected: selectedIndex==0,
        ),
        SizedBox(height: 6),
        Shipitem(
          onaTap: () {

            setState(() {
              selectedIndex=1;
            });
          },
          title: "الدفع اونلاين",
          subTitle: "يرجي تحديد طريقة الدفع",
          price: 40,
          isSelected: selectedIndex==1,
        ),
      ],
    );
  }
}
