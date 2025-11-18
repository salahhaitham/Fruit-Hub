import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:meta/meta.dart';

part 'CartCubit_state.dart';

class CartCubit extends Cubit<AddProductState> {
  CartCubit() : super(AddProductInitial());

  CartEntity cartEntity = CartEntity([]);
  void addproduct(ProductEntity product) {
    var isExist = cartEntity.isItemExist(product);
    CartItemEntity cartItem = cartEntity.getCartItem(product);

    if (isExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.cartItems.add(cartItem);
    }
    emit(ProductAdded());
  }

  void removeproduct(ProductEntity product) {
   cartEntity.removeCartEntity(product);
    emit(ProductRemoved());

}
  void decreseCount(ProductEntity product) {
    cartEntity.decrease(product);
  emit(ProductCountDecrease());
  }
}
