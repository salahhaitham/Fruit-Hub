import 'package:ecommerce_app/Features/Home_Feature/manager/CartCubit/Cart_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/manager/products_cubit/products_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/search/SearchVew.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/App_TextStyles.dart';
import '../../../../../core/utils/gen/assets.gen.dart';

class Searchtextfield extends StatelessWidget {
  const Searchtextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextField(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Searchvew();
            },
          ),
        ),
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
