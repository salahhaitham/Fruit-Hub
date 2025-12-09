part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
final class getFavoriteLoading extends FavoriteState {}
final class AddFavoritesuccess extends FavoriteState {}
final class RemoveFavoritesuccess extends FavoriteState {}
final class getFavoritesuccess extends FavoriteState {

}

final class getFavoriteFailure extends FavoriteState {}

