
import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Lastsearchitem extends StatelessWidget {
  const Lastsearchitem({Key? key, required this.lastSearchText}) : super(key: key);

 final String lastSearchText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.history),
        SizedBox(width: 8,),
        GestureDetector(
            onTap: () {
              var cubit=context.read<ProductsCubit>();
             cubit.selectLastSearch(lastSearchText);
              cubit.getSearchedProducts(text: lastSearchText);



            },
            child: Text(lastSearchText,style: AppTextStyles.body16Bold,)),
        Spacer(),
        GestureDetector(
            onTap: () {

              var cubit = context.read<ProductsCubit>();

              List oldList = cubit.box.get('lastsearch', defaultValue: []);
              oldList.remove(lastSearchText);
              cubit.box.put('lastsearch', oldList);

              // Emit جديد لتحديث الـ UI
              cubit.emit(getSearchedProductsInitial());

            },
            child: Icon(Icons.close)),
      ],
    );

  }
}
