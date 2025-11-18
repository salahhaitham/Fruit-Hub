import 'package:ecommerce_app/core/Services/DatabaseServices.dart';
import 'package:ecommerce_app/core/Services/FireStoreServices.dart';
import 'package:ecommerce_app/core/repos/product_repo/product_repo.dart';
import 'package:ecommerce_app/core/repos/product_repo/products_repoImp.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce_app/core/Services/FirebaseAuthService.dart';
import 'package:ecommerce_app/Features/Auth/data/repos/AuthRepoImp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => FireStoreservices());
  getIt.registerLazySingleton(() => ProductRepoImpl(getIt.get<FireStoreservices>()));


  getIt.registerLazySingleton(() => AuthRepoImp(getIt<FirebaseAuthService>(),getIt<FireStoreservices>()));
}
