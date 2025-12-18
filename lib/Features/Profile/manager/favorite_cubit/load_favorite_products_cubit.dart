import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/repos/loadFavoritsRepo.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:meta/meta.dart';

part 'load_favorite_products_state.dart';

class LoadFavoriteProductsCubit extends Cubit<LoadFavoriteProductsState> {
  LoadFavoriteProductsCubit(this.loadFavoritesRepo) : super(LoadFavoriteProductsInitial());
  LoadFavoritesRepo loadFavoritesRepo;

  Future<void> loadFavProducts() async {
    emit(LoadFavoriteProductsLoading());
    var result = await loadFavoritesRepo.loadFavorites();
    result.fold(
      (failure) {
        emit(LoadFavoriteProductsFailure(failure.errormessage));
      },
      (success) {
        emit(LoadFavoriteProductsSuccess(success));
      },
    );
  }
}
