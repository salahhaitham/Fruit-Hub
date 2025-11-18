
import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/GridViewFruitItem_BlocBuilder.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/HomeViewBody.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/ProductsHeader.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/SearchTextfield.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/productsViewBody.dart';
import 'package:ecommerce_app/core/Services/Getit_Service.dart';
import 'package:ecommerce_app/core/repos/product_repo/products_repoImp.dart';
import 'package:ecommerce_app/core/widgets/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/gen/assets.gen.dart';
import '../../../../core/utils/App_TextStyles.dart';

class Productsview extends StatelessWidget {
  const Productsview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return ProductsCubit(getIt.get<ProductRepoImpl>())..getProducts();
        },
        child:Productsviewbody() );
  }
}



