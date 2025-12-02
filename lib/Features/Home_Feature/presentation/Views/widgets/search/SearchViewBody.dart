
import 'package:ecommerce_app/Features/Home_Feature/manager/CartCubit/Cart_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/Notification_View.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/search/lastSearchView.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../core/utils/App_TextStyles.dart';
import '../../../../../../core/utils/gen/assets.gen.dart';
import '../../../../../../core/widgets/NotificationWidget.dart';
import 'SearchVew.dart';
import 'NestedSearchTextField.dart';
import 'SearchGridView.dart';

class Searchviewbody extends StatelessWidget {
  const Searchviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: BlocListener<CartCubit,CartcubitState>(
          listener: (context, state) {
            if (state is ProductAdded){
              showSnackBar(context, "تم اضافة العنصر بنجاح");
            }
          },
          child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      AppBar(
                        centerTitle: true,
                        title: Text("search", style: AppTextStyles.body19Bold),
                        leading: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_ios),
                        ),
                        actions: [
                          IconButton(onPressed: () {
                            Navigator.pushNamed(context, NotificationView.routename);
                          }, icon: Notification_Widget()),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 9,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(0),
                          ),
                        ),
                        child: NestedSearchTextField(),

                      ),


                    ],
                  ),
                ),

                SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    sliver: Searchgridview_BlocBuilder())
              ]
          ),
        ),
      );

  }
}
