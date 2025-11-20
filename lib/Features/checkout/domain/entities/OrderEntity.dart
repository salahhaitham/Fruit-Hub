import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/AddressEntity.dart';

class OrderEntity{
  CartEntity cartEntity;
AddressOrderEntity addressEntity;
bool? payWithCash;
  OrderEntity(this.cartEntity,this.addressEntity,this.payWithCash);
}