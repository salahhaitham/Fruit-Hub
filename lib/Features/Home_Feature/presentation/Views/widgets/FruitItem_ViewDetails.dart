
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/FruititemViewdetailsBody.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:flutter/material.dart';

class FruititemViewdetails extends StatelessWidget {
  const FruititemViewdetails({Key? key, required this.productEntity}) : super(key: key);
static const routename="fruititemviewdetails";
final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Fruititemviewdetailsbody(productEntity:productEntity ,);
  }
}
