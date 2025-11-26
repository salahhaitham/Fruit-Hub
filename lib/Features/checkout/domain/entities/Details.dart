import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';

class Details {
  Details({
      this.subtotal, 
      this.shipping, 
      this.shippingDiscount,});

  String? subtotal;
  String? shipping;
  num? shippingDiscount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtotal'] = subtotal;
    map['shipping'] = shipping;
    map['shipping_discount'] = shippingDiscount;
    return map;
  }
factory Details.fromEntity(CartEntity entity){
    return Details(
      shipping: entity.getShippingPrice().toString(),
      subtotal: entity.CaluculateTotalPrice().toString(),
      shippingDiscount: entity.getShippingDiscount()
    );
}
}