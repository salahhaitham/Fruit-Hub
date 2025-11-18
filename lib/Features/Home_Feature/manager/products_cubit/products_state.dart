part of 'products_cubit.dart';

@immutable
sealed class getProductsState {}

final class getProductsInitial extends getProductsState {}
final class getProductsLoding extends  getProductsState {}
final class getProductsSuccess extends getProductsState {
   List<ProductEntity>products;
  getProductsSuccess(this.products);
}
final class getProductsFailure extends getProductsState {
  final String errmessage;
  getProductsFailure(this.errmessage);
}
