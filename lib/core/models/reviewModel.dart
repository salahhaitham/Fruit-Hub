import 'package:ecommerce_app/core/entities/reviewEntity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDescribtion;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescribtion,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(name:json['name'], image: json['image'], rating:json['rating'], date:json['date'], reviewDescribtion:json['reviewDescribtion']

    );
  }

    ReviewEntity toEntity(){
   return ReviewEntity(name: name, image: image, rating: rating, date: date, reviewDescribtion: reviewDescribtion);
  }

  Map<String, dynamic> toMap() {
    return {
      'name':name ,
      'image': image,
      'rating': rating,
      'date':date,
      'reviewDescribtion':reviewDescribtion
    };
  }

  factory ReviewModel.fromEntity(ReviewEntity reviewentity) {
    return ReviewModel(
      name: reviewentity.name,
      image: reviewentity.image,
      rating: reviewentity.rating,
      date: reviewentity.date,
      reviewDescribtion: reviewentity.reviewDescribtion,
    );
  }
}
