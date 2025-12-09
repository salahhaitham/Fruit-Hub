import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/Home_Feature/domain/repos/loadFavoritsRepo.dart';
import 'package:ecommerce_app/core/Services/FireStoreServices.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';

import '../../../../core/Helper_Functions/getuser.dart';
import '../../../../core/models/productModel.dart';

class LoadFavoritesRepoImp extends LoadFavoritesRepo{

  @override
  Future<Either<Failure, List<ProductEntity>>> loadFavorites() async{
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(getUser().Uid)
          .collection('favorites')
          .get();
      // بدل cast غلط
      List<Map<String, dynamic>> productsData = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      var products = productsData
          .map((e) => productmodel.fromjson(e).toEntity())
          .toList();
      return right(products);
    } on Exception catch (e) {
      return left(Serverfailure(e.toString()));
    }

  }

}