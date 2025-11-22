import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/ShippingAddressOrderEntity.dart';

class OrderEntity{
  String uId;
  CartEntity cartEntity;
  ShippingAddressOrderEntity shippingAddressOrderEntity;
bool? payWithCash;
  OrderEntity( this.cartEntity, this.uId,this.shippingAddressOrderEntity,this.payWithCash,);
}