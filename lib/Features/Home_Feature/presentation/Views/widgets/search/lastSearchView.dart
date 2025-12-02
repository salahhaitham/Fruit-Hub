import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/App_TextStyles.dart';
import 'lastSearchItem.dart';

class LastSearchView1 extends StatelessWidget {
  const LastSearchView1({super.key, required this.lastSearchList});

  final List<String> lastSearchList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Text("عمليات البحث الاخيرة ", style: AppTextStyles.body16Bold),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    var cubit=   context.read<ProductsCubit>();
                    cubit.box.delete('lastsearch');
                    cubit.emit(getSearchedProductsInitial());

                  },
                  child: Text("حذف الكل",style: AppTextStyles.body16Regular,))
            ],
          ),
        ),

        ...lastSearchList.map((text) => Lastsearchitem(lastSearchText: text)),
      ]),
    );
  }
}
