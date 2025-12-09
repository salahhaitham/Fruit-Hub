import 'package:ecommerce_app/Features/checkout/domain/entities/ShippingAddressOrderEntity.dart';
import 'package:flutter/foundation.dart';

class ShippingAddressOrderModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? floorNumber;
  String? phoneNumber;

  ShippingAddressOrderModel({
   required this.name,
   required this.email,
   required this.address,
   required this.city,
   required this.floorNumber,
    required this.phoneNumber
  });
  factory ShippingAddressOrderModel.fromMap(Map<String, dynamic> map) {
    return ShippingAddressOrderModel(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      address: map["address"] ?? "",
      city: map["city"] ?? "",
      floorNumber: map["floornumber"] ?? "",
      phoneNumber: map["phonenumber"]??"",
    );
  }

  factory ShippingAddressOrderModel.fromEntity(ShippingAddressOrderEntity address){
    return ShippingAddressOrderModel(
        name: address.name,
        email: address.email,
        address: address.address,
        city: address.city,
        floorNumber: address.floorNumber,
        phoneNumber: address.phoneNumber
    );

  }
  toJson(){
    return {
      "name":name,
      "email":email,
      "address":address,
      "city":city,
      "floornumber":floorNumber,
      "phonenumber":phoneNumber
    };
  }

}