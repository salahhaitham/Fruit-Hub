part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class getProductsInitial extends ProductsState {}
final class getProductsLoding extends  ProductsState {}
final class getProductsSuccess extends ProductsState {
   List<ProductEntity>products;
  getProductsSuccess(this.products);
}
final class getProductsFailure extends ProductsState {
  final String errmessage;
  getProductsFailure(this.errmessage);
}
final class getSearchedProductsInitial extends  ProductsState {}
final class getSearchedProductsInitialStart extends  ProductsState {}

final class getSearchedProductsLoding extends  ProductsState {}
final class getSearchedProductsSuccess extends  ProductsState {
List<ProductEntity>products;
getSearchedProductsSuccess(this.products);
}
final class getSearchedProductsFailure extends  ProductsState {}
final class SearchTextSelectedState extends  ProductsState {}
