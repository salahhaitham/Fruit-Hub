part of 'load_favorite_products_cubit.dart';

@immutable
sealed class LoadFavoriteProductsState {}

final class LoadFavoriteProductsInitial extends LoadFavoriteProductsState {}
final class LoadFavoriteProductsLoading extends LoadFavoriteProductsState {}
final class LoadFavoriteProductsSuccess extends LoadFavoriteProductsState {
  List<ProductEntity>favoritesList;
  LoadFavoriteProductsSuccess(this.favoritesList);
}
final class LoadFavoriteProductsFailure extends LoadFavoriteProductsState {
  final String errormessage;
  LoadFavoriteProductsFailure(this.errormessage);
}



