import 'dart:io';
import 'dart:math';

import 'package:ecommerce_app/core/entities/reviewEntity.dart';
import 'package:ecommerce_app/core/models/reviewModel.dart';

import '../entities/productEntity.dart';

class productmodel {
  final String name;
  final num price;

  final String describtion;
  final String code;
  final bool isfeatured;
  final String? imageUrl;

  final int numberOfCalories;
  final int expirationsMonths;
  final bool isOrganic;
  final num avgRating;
  final num sellingCount;
  final num ratingCount;
  final int unitAmount;
 final  List<ReviewModel> reviews;
  productmodel({
    required this.reviews,
    required this.numberOfCalories,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.avgRating,
    required this.ratingCount,
    required this.unitAmount,

    required this.price,
    required this.describtion,
    required this.code,
    required this.isfeatured,
    required this.imageUrl,
    required this.sellingCount,
    required this.name,
  });

 ProductEntity toEntity(){

  return ProductEntity(
      reviews: reviews.map((e)=>e.toEntity()).toList(),
      numberOfCalories: numberOfCalories,
      expirationsMonths: expirationsMonths,
      isOrganic: isOrganic,
      avgRating: avgRating,
      ratingCount: ratingCount,
      unitAmount: unitAmount,
      name: name,
      price: price,
      imageUrl: imageUrl,
      description: describtion,
      code: code,
      isfeatured: isfeatured);


}
  factory productmodel.fromjson(Map<String, dynamic> json) {
    return productmodel(

      price: json['price'],
      describtion: json['description']??"unknown",
      code: json['code'],
      isfeatured: json['isfeatured'],
      imageUrl: json['imageurl'],
      name: json['name'],
      avgRating: json['avgRating']??0,
      ratingCount: json['ratingCount']??0,
      numberOfCalories: json['numberOfCalories']??0,
      isOrganic: json['isOrganic']??false,
      expirationsMonths: json['expirationsMonths']??0,
      unitAmount: json['unitAmount']??0,
      sellingCount: json['sellingCount']??0,
      reviews:( json['reviews'] as List<dynamic>?)?.map((e)=>ReviewModel.fromJson(e)).toList()??[],

    );
  }
  Tomap() {
    return {
      'name': name,
      'price': price,
      'describtion': describtion,
      'code': code,
      'isfeatured': isfeatured,
      'imageurl': imageUrl,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'numberOfCalories': numberOfCalories,
      'isOrganic': isOrganic,
      'expirationsMonths': expirationsMonths,
      'unitAmount': unitAmount,
      'reviews':reviews.map((e)=>e.toMap()).toList()
    };
  }
}
