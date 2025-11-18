import 'package:ecommerce_app/core/entities/productEntity.dart';

class CartItemEntity{

  ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count=0});

  num getTotalPrice(){

    num totalPrice=productEntity.price*count;
    return totalPrice;
  }
  num getTotalWieght(){

    num totalAmount=productEntity.unitAmount*count;
    return totalAmount;
  }
  num increaseCount(){
    return count++;
  }
  num decreaseCount(){
    return count--;
  }
}