import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/Helper_Functions/getuser.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';
import 'package:ecommerce_app/core/models/productModel.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteProuductCubit extends Cubit<FavoriteState> {
  FavoriteProuductCubit() : super(FavoriteInitial());

  final List<String> _favoriteProductIds = [];
  final _favoritesStreamController = StreamController<List<String>>.broadcast();

  Stream<List<String>> get favoritesStream => _favoritesStreamController.stream;

  bool isFavorite(ProductEntity product) {
    return _favoriteProductIds.contains(product.code);
  }




  Future<void> loadFavorites() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(getUser().Uid)
        .collection('favorites')
        .get();

    _favoriteProductIds.clear();
    for (var doc in snapshot.docs) {
      _favoriteProductIds.add(doc.id);
    }

    _favoritesStreamController.add(_favoriteProductIds);
    emit(getFavoriteLoading());
  }


  Future<void> toggleFavorite(ProductEntity product) async {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(getUser().Uid)
        .collection('favorites')
        .doc(product.code);

    if (isFavorite(product)) {
      await docRef.delete();
      _favoriteProductIds.remove(product.code);
    } else {
      await docRef.set(productmodel.fromEntity(product).Tomap());
      _favoriteProductIds.add(product.code);
    }

    _favoritesStreamController.add(_favoriteProductIds);
  }

  @override
  Future<void> close() {
    _favoritesStreamController.close();
    return super.close();
  }
}
