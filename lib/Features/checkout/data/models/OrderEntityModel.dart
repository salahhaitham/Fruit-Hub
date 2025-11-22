import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';
import 'package:ecommerce_app/Features/checkout/data/models/ShippingAddressModel.dart';
import 'package:ecommerce_app/Features/checkout/data/models/orderdata.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/ShippingAddressOrderEntity.dart';

class OrderEntityModel {
 final num totalPrice;
final  String uId;
final  ShippingAddressOrderModel shippingAddressOrderModel;
final  List<OrderData> orderProducts;
 final String paymentMethod;

  OrderEntityModel({
   required this.uId,
    required  this.shippingAddressOrderModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.totalPrice,}
  );
  factory OrderEntityModel.fromOrderEntity(OrderEntity OrderEntity){
    return OrderEntityModel(
      uId: OrderEntity.uId, 
        shippingAddressOrderModel: ShippingAddressOrderModel.fromEntity(OrderEntity.shippingAddressOrderEntity), 
        orderProducts: OrderEntity.cartEntity.cartItems.map((e)=>OrderData.fromCartItemEntity(e)).toList(),
        paymentMethod: OrderEntity.payWithCash!? "cash":"paypal",
        totalPrice: OrderEntity.cartEntity.CaluculateTotalPrice());
  }
  
  toJson() {
    return {
      "totalPrice": totalPrice,
      "uid": uId,
      "address": shippingAddressOrderModel.toJson(),
      "orderdata": orderProducts.map((e) => e.toJson()),
      "paymentmethod": paymentMethod,
    };
  }
}
