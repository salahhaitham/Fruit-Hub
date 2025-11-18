import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';

class CartEntity {
  List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  num CaluculateTotalPrice() {
    num totalPrice = 0;
    for (var carItem in cartItems) {
      totalPrice += carItem.getTotalPrice();
    }
    return totalPrice;
  }

  bool isItemExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity.code == product.code) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity.code == product.code) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }

  void removeCartEntity(ProductEntity product) {
    cartItems.removeWhere(
      (cartItem) =>
          cartItem.productEntity.code == product.code || cartItem.count <= 0,
    );
  }

  CartItemEntity decrease(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity.code == product.code) {
        if (cartItem.count > 0) {
          cartItem.count -= 1;
        }
      }
    }
    return CartItemEntity(productEntity: product);
  }
}
