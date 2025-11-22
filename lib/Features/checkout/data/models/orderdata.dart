import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';

class OrderData{
  String name;
  num price;
  String? imageUrl;
  num count;
  String code;

  OrderData({required this.name,required this.price,required this.imageUrl,required this.count,required this.code});



  factory OrderData.fromCartItemEntity(CartItemEntity cartItem){
    return OrderData(

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