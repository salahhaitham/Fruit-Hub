import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/ShipItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shippingsection extends StatefulWidget {
  const Shippingsection({Key? key}) : super(key: key);

  @override
  State<Shippingsection> createState() => _ShippingsectionState();
}

class _ShippingsectionState extends State<Shippingsection> with AutomaticKeepAliveClientMixin {

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    var orderEntity=context.read<OrderEntity>();
    return Column(
      children: [
        SizedBox(height: 30),
        Shipitem(
          onaTap: () {

            setState(() {
              selectedIndex=0;
              orderEntity.payWithCash=true;
            });
          },
          title: "الدفع عند الاستلام",
          subTitle: "التسليم من المكان",
          price: orderEntity.cartEntity.CaluculateTotalPrice()+40,
          isSelected: selectedIndex==0,
        ),
        SizedBox(height: 6),
        Shipitem(
          onaTap: () {

            setState(() {
              selectedIndex=1;
              orderEntity.payWithCash=false;
            });
          },
          title: "الدفع اونلاين",
          subTitle: "يرجي تحديد طريقة الدفع",
          price:orderEntity.cartEntity.CaluculateTotalPrice(),
          isSelected: selectedIndex==1,
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
