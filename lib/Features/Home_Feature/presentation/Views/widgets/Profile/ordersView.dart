
import 'package:ecommerce_app/Features/Home_Feature/data/repos/getOrdersRepoImp.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/OrdersViewBody.dart';
import 'package:ecommerce_app/Features/checkout/manager/orders/orders_cubit.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../manager/ordersCubit/orders_cubit.dart';


class Ordersview extends StatelessWidget {
  const Ordersview({Key? key}) : super(key: key);
static const routename="ordersview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("طلباتي",style: AppTextStyles.body19Bold,),
      ),
      body: BlocProvider(
          create: (context) => GetOrdersCubit(getIt.get<getOrdersRepoImp>())..FetchOrders(),
          child: OrdersViewBody_BlocBuilder()),
    );
  }
}

class OrdersViewBody_BlocBuilder extends StatelessWidget {
  const OrdersViewBody_BlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit,GetOrdersState>(
        builder: (context, state) {
          if (state is getOrdersSuccess) {
            return Ordersviewbody(orders: state.orders,);
          }else if(state is getOrdersLoading) {return Center(child: CircularProgressIndicator());}
          else if(state is getOrdersFailure) {return Text("failure");}
          else{
            return Text("loading");

          }
        },


    );
  }
}
