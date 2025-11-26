import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';

class Items {
  Items({
      this.name, 
      this.quantity, 
      this.price, 
      this.currency,});


  String? name;
  num? quantity;
  String? price;
  String? currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    map['price'] = price;
    map['currency'] = currency;
    return map;
  }
factory Items.fromEntity(CartItemEntity entity){
    return Items(
      name:entity.productEntity.name ,
      price:entity.productEntity.price.toString() ,
      currency:"USD" ,
      quantity:entity.count
    );
}
}