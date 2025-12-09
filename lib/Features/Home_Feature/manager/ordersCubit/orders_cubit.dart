import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/repos/getOrdersRepo.dart';
import 'package:ecommerce_app/Features/checkout/data/models/OrderItemModel.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.getOrders) : super(getOrdersInitial());

  StreamSubscription ? _streamSubscription;
  getOrdersRepo getOrders;

  void FetchOrders()async{
    emit(getOrdersLoading());



    _streamSubscription=getOrders.getorders().listen((result){

      result.fold(

              (failure){
            emit(getOrdersFailure(failure.errormessage));
          }, (orders){
        emit(getOrdersSuccess(orders));
      }
      );

    });

  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

}
