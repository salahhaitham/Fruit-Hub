
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/ShippingAddressOrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/manager/orders/orders_cubit.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutViewBody.dart';
import 'package:ecommerce_app/Features/checkout/presentation/views/widgets/CheckoutViewBody_BlocConsumer.dart';
import 'package:ecommerce_app/core/Helper_Functions/getuser.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:ecommerce_app/core/repos/orders/OrdersRepoImpl.dart';
import 'package:ecommerce_app/core/widgets/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Checkoutview extends StatelessWidget {
  const Checkoutview({Key? key,required this.cartEntity}) : super(key: key);
static const String routename='checkoutview';
final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) {
        return OrdersCubit(getIt.get<OrdersRepoImpl>());
      },
      child: Scaffold(
         resizeToAvoidBottomInset: false,
        appBar: buildAppBar(title: "الشحن",showArrowBack: false),
        body:Provider<OrderEntity>(
        create: (_) => OrderEntity(cartEntity,getUser().Uid,ShippingAddressOrderEntity(),null),
      child: CheckoutviewbodyBlocconsumer(widget: Checkoutviewbody(cartEntity: cartEntity)),
      )),
    );
  }
}
