import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/Services/Backend_EndPoints.dart';
import 'package:ecommerce_app/core/Services/DatabaseServices.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/errors/Failure.dart';
import 'package:ecommerce_app/core/models/productModel.dart';
import 'package:ecommerce_app/core/repos/product_repo/product_repo.dart';
import 'package:ecommerce_app/generated/l10n.dart';

class ProductRepoImpl extends ProductRepo {
  DatabaseServices databaseServices;

  ProductRepoImpl(this.databaseServices);

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseServices.getdata(
        path: Backend_EndPoints.Kproducts,
        // query: {
        //   'limit': 10,
        //   'orderBy': 'sellingCount',
        //   'descending':true,
        // },
      );
      List<Map<String, dynamic>> productData = (data as List)
          .cast<Map<String, dynamic>>();
      var products = productData
          .map((e) => productmodel.fromjson(e).toEntity())
          .toList();
      return right(products);
    } on Exception catch (e) {
      return left(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getproducts() async {
    try {
      var data = await databaseServices.getdata(path: Backend_EndPoints.Kproducts);
      List<Map<String, dynamic>> productsData = (data as List).cast<Map<String, dynamic>>();
      var products = productsData
          .map((e) => productmodel.fromjson(e).toEntity())
          .toList();
      return right(products);
    } on Exception catch (e) {
      return left(Serverfailure(e.toString()));
    }
  }
}

/*
  @override
  Future<Either<Failure, ProductEntity>> getBestSellingProducts() async {
    try {
      var data =await
          databaseServices.getdata(
                path: Backend_EndPoints.Kproducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': "true",
                },
              )
          ;

      List<ProductEntity> products = await data
          .map((e) => productmodel.fromjson(e).toEntity()).toList();
      return right(products);
    } on Exception catch (e) {
      return left(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getproducts() async {
    try {
      var data =
          databaseServices.getdata(path: Backend_EndPoints.Kproducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = await data
          .map((e) => productmodel.fromjson(e).toEntity())
          .toList();
      return right(products as ProductEntity);
    } on Exception catch (e) {
      return left(Serverfailure(e.toString()));
    }
  }
}
*/
