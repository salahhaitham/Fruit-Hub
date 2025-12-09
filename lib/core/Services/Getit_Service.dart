import 'package:ecommerce_app/Features/Home_Feature/data/repos/AddImgUrlToUser_RepoImp.dart';
import 'package:ecommerce_app/Features/Home_Feature/data/repos/getOrdersRepoImp.dart';
import 'package:ecommerce_app/Features/Home_Feature/data/repos/uploadImageRepoImpl.dart';
import 'package:ecommerce_app/Features/Home_Feature/data/repos/NotificationRepoImp.dart';
import 'package:ecommerce_app/Features/Home_Feature/data/repos/LoadFavoritesRepoImp.dart';
import 'package:ecommerce_app/core/Services/DatabaseServices.dart';
import 'package:ecommerce_app/core/Services/FireStoreServices.dart';
import 'package:ecommerce_app/core/Services/SupabaseStorageService.dart';
import 'package:ecommerce_app/core/repos/orders/OrdersRepoImpl.dart';
import 'package:ecommerce_app/core/repos/product_repo/product_repo.dart';
import 'package:ecommerce_app/core/repos/product_repo/products_repoImp.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce_app/core/Services/FirebaseAuthService.dart';
import 'package:ecommerce_app/Features/Auth/data/repos/AuthRepoImp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => FireStoreservices());
  getIt.registerLazySingleton(() => SupabaseStorageService());
  getIt.registerLazySingleton(() => ProductRepoImpl(getIt.get<FireStoreservices>()));

  getIt.registerLazySingleton(() => OrdersRepoImpl(getIt.get<FireStoreservices>()));
  getIt.registerLazySingleton(() => LoadFavoritesRepoImp());
  getIt.registerLazySingleton(() => getOrdersRepoImp(getIt.get<FireStoreservices>()));
  getIt.registerLazySingleton(() => UploadImageRepoImpl(getIt.get<SupabaseStorageService>()));
  getIt.registerLazySingleton(() => AddImgUrlToUser_RepoImp(getIt.get<FireStoreservices>()));
  getIt.registerLazySingleton(() => NotificationRepoImp(getIt.get<FireStoreservices>()));
  getIt.registerLazySingleton(() => AuthRepoImp(getIt<FirebaseAuthService>(),getIt<FireStoreservices>()));
}
