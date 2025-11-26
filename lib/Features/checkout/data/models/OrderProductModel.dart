import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';

class OrderProductModel{
  String name;
  num price;
  String? imageUrl;
  num count;
  String code;

  OrderProductModel({required this.name,required this.price,required this.imageUrl,required this.count,required this.code});



  factory OrderProductModel.fromCartItemEntity(CartItemEntity cartItem){
    return OrderProductModel(

        name: cartItem.productEntity.name,
        price: cartItem.productEntity.price,
        imageUrl: cartItem.productEntity.imageUrl,
        count: cartItem.count,
        code: cartItem.productEntity.code);
}
 toJson(){
    return {
      "name":name,
      "price":price,
      "imageurl":imageUrl,
      "count":count,
      "code":code
      };
 }
}