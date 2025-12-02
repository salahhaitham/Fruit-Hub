import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';
import 'package:ecommerce_app/Features/checkout/data/models/ShippingAddressModel.dart';
import 'package:ecommerce_app/Features/checkout/data/models/OrderProductModel.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/OrderEntity.dart';
import 'package:ecommerce_app/Features/checkout/domain/entities/ShippingAddressOrderEntity.dart';
import 'package:ecommerce_app/core/enums/orderenum.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
 final num totalPrice;
final  String uId;
final  ShippingAddressOrderModel shippingAddressOrderModel;
final  List<OrderProductModel> orderProducts;
 final String paymentMethod;
 final String status;
 final String orderId;

  OrderModel({
    required this.orderId,
   required this.uId,
    required  this.shippingAddressOrderModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.totalPrice,required this.status,}
  );
  factory OrderModel.fromOrderEntity(OrderEntity OrderEntity){
    return OrderModel(
      orderId: Uuid().v4(),
      status: "status",
      uId: OrderEntity.uId, 
        shippingAddressOrderModel: ShippingAddressOrderModel.fromEntity(OrderEntity.shippingAddressOrderEntity), 
        orderProducts: OrderEntity.cartEntity.cartItems.map((e)=>OrderProductModel.fromCartItemEntity(e)).toList(),
        paymentMethod: OrderEntity.payWithCash!? "cash":"paypal",
        totalPrice: OrderEntity.cartEntity.CaluculateTotalPrice());
  }
  
  toJson() {
    final now = DateTime.now();

    final formattedDate = "${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}";
    return {
      "totalPrice": totalPrice,
      "uid": uId,
      "address": shippingAddressOrderModel.toJson(),
      "orderdata": orderProducts.map((e) => e.toJson()).toList(),
      "paymentmethod": paymentMethod,
      "status":"pending",
       "orderid":orderId,
       "orderdate":formattedDate,
    };
  }
}
