import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/repos/product_repo/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(getProductsInitial());
  ProductRepo productRepo;
  Timer? _debounce;
  var box=Hive.box(KlastSearch);
  var lastSearchText="";
  final TextEditingController searchController = TextEditingController();



  List<ProductEntity>ProductsList=[];


  Future<void>getProducts()async{
    emit(getProductsLoding());
    var products=await productRepo.getproducts();
    products.fold(
        (failure){
          emit(getProductsFailure(failure.toString()));
        },
        (products){
          ProductsList=products;
          emit(getProductsSuccess(ProductsList));
        });


  }


  Future<void>getSearchedProducts({required String text})async{
    emit(getSearchedProductsInitialStart());
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    if (text.trim().isEmpty) {
      emit(getSearchedProductsSuccess([]));
      return;
    }
    _debounce = Timer(Duration(milliseconds: 500), () async {
      emit(getSearchedProductsLoding());
      var products = await productRepo.getSearchedproducts(text);
      products.fold(
              (failure) {
            emit(getProductsFailure(failure.toString()));
          },
              (products) {

            emit(getSearchedProductsSuccess(products));
          });

    }
    );}

  Future<void>getBestSellingProducts()async{
    emit(getProductsLoding());
    var products=await productRepo.getBestSellingProducts();
    products.fold(
            (failure){
          emit(getProductsFailure(failure.toString()));
        },
            (products){

          emit(getProductsSuccess(products));
        });


  }
  void selectLastSearch(String text) {
    lastSearchText = text;
    searchController.text = text; // أهم خطوة
    searchController.selection = TextSelection.fromPosition(
      TextPosition(offset: text.length),
    );
    emit(SearchTextSelectedState());
  }
}
