import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<getProductsState> {
  ProductsCubit(this.productRepo) : super(getProductsInitial());
  ProductRepo productRepo;

  Future<void>getProducts()async{
    emit(getProductsLoding());
    var products=await productRepo.getproducts();
    products.fold(
        (failure){
          emit(getProductsFailure(failure.toString()));
        },
        (products){
          emit(getProductsSuccess(products));
        });


  }
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

}
