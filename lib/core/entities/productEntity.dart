import 'package:ecommerce_app/core/entities/reviewEntity.dart';

class ProductEntity {
  String name;
  num price;

  String description;
  String code;
  bool isfeatured;
  String? imageUrl;
  final int numberOfCalories;
  final int expirationsMonths;
  final bool isOrganic;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewEntity>reviews;

  ProductEntity({
    required this.reviews,
      required this.numberOfCalories,
      required  this.expirationsMonths,
      required  this.isOrganic,
      required this.avgRating,
      required this.ratingCount,
  required this.unitAmount,
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    required this.isfeatured,
    this.imageUrl,
  });
}
