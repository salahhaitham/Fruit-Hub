import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';
import 'package:meta/meta.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItem) {
    emit(CartItemUpdated(cartItem));
  }
}
