
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../core/utils/App_TextStyles.dart';
import '../../../../../../core/utils/gen/assets.gen.dart';
import '../../../../manager/products_cubit/products_cubit.dart';

class NestedSearchTextField extends StatelessWidget {
 const  NestedSearchTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<ProductsCubit>();
    return BlocBuilder<ProductsCubit,ProductsState>(
      builder:(context, state) =>  TextField(
      controller: cubit.searchController,
        onSubmitted: (value) {
          context.read<ProductsCubit>().getSearchedProducts(text: value);
          var box = context.read<ProductsCubit>().box;

          List oldList = box.get('lastsearch', defaultValue: []);

          if (value.trim().isNotEmpty) {
            if (!oldList.contains(value)) {
              oldList.add(value);
              box.put('lastsearch', oldList);
            }
          }

        },
        onChanged:(value) {   if(value.isEmpty){

          context.read<ProductsCubit>().emit(getProductsInitial());}
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'ابحث عن.......',
          hintStyle: AppTextStyles.body13Regular.copyWith(
            color: Color(0xFF949D9E),
          ),
          border: _buildOutlineInputBorder(),
          enabledBorder: _buildOutlineInputBorder(),
          focusedBorder: _buildOutlineInputBorder(),
          suffixIcon: SizedBox(
            width: 10,
            child: Center(
              child: SvgPicture.asset(Assets.images.settings, width: 30),
            ),
          ),
          prefixIcon: SizedBox(
            width: 10,
            child: Center(child: SvgPicture.asset(Assets.images.searchicon)),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: Colors.white),
    );
  }
}
