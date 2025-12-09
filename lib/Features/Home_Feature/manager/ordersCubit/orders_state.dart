part of 'orders_cubit.dart';

@immutable
sealed class GetOrdersState {}


final class getOrdersInitial extends GetOrdersState {}
final class getOrdersLoading extends GetOrdersState {}

final class getOrdersSuccess extends GetOrdersState {
List<OrderItemModel>orders;
getOrdersSuccess(this.orders);
}
final class getOrdersFailure extends GetOrdersState {
String errmessage;
getOrdersFailure (this.errmessage);
}

