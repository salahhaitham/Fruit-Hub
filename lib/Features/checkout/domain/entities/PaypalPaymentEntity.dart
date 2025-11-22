import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/ItemList.dart';

import 'Amount.dart';

class PaypalPaymentEntity {
  PaypalPaymentEntity({
    this.amount,
    this.description,
    this.itemList,});

  Amount? amount;
  String? description;
  ItemList? itemList;

  factory PaypalPaymentEntity.fromEntity(CartEntity entity){
    return PaypalPaymentEntity(amount:Amount.fromEntity(entity),description: "payment",itemList: ItemList.formEntity(entity.cartItems));
  }


}