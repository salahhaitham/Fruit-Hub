import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';
import 'package:ecommerce_app/core/repos/orders/OredersRepo.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  OrdersRepo ordersRepo;
  Future<void> addOrder(OrderEntity order) async {
    emit(OrdersLoading());
    var result = await ordersRepo.addOrder(order);
    result.fold(
      (left) {
        emit(OrdersFailure());
      },
      (success) {
        emit(OrdersSuccess());
      },
    );
  }
}
