import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartItemEntity.dart';
import 'package:ecommerce_app/Features/Home_Feature/manager/CartCubit/Cart_cubit.dart';
import 'package:ecommerce_app/core/entities/productEntity.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:ecommerce_app/core/utils/gen/assets.gen.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

class Fruititemviewdetailsbody extends StatefulWidget {
  const Fruititemviewdetailsbody({Key? key, required this.productEntity})
    : super(key: key);
  final ProductEntity productEntity;

  @override
  State<Fruititemviewdetailsbody> createState() =>
      _FruititemviewdetailsbodyState();
}

class _FruititemviewdetailsbodyState extends State<Fruititemviewdetailsbody> {
  var prouctCount = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F5F7),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(width * 0.5, 50),
                        bottomRight: Radius.elliptical(width * 0.5, 50),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.04,
                    left: 0,
                    right: 0,

                    child: FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.network(
                          widget.productEntity.imageUrl!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        return Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Center(
                          child: Icon(Icons.arrow_back_ios, size: 20),
                        ),
                        decoration: ShapeDecoration(
                          color: Color(0xffFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(300),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  title: Text(
                    widget.productEntity.name,
                    style: AppTextStyles.body16Bold.copyWith(
                      color: Colors.black,
                    ),
                  ),

                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: widget.productEntity.price.toString(),
                          style: AppTextStyles.body13Bold.copyWith(
                            color: App_colors.secondrycolor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.body11Bold.copyWith(
                            color: App_colors.secondrycolor,
                          ),
                        ),
                        TextSpan(text: ' '),
                        TextSpan(
                          text: 'الكيلو',
                          style: AppTextStyles.heading13semiBold.copyWith(
                            color: App_colors.secondrycolor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: IntrinsicWidth(
                    child: Row(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration: ShapeDecoration(
                            color: App_colors.primarycolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(100),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              prouctCount++;
                              setState(() {});
                            },
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 13),
                        Text(
                          prouctCount.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF06140C) /* Green1-950 */,
                            fontSize: 16,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 13),
                        Container(
                          height: 36,
                          width: 36,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF3F5F7),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFFF1F1F5),
                                width: 1,
                              ),

                              borderRadius: BorderRadiusGeometry.circular(100),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (prouctCount > 0) {
                                setState(() {
                                  prouctCount--;
                                });
                              }
                            },
                            child: Icon(Icons.remove, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFC529)),
                    SizedBox(width: 8),
                    Text(
                      widget.productEntity.avgRating.toString(),
                      style: AppTextStyles.heading13semiBold,
                    ),
                    SizedBox(width: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '(',
                            style: AppTextStyles.body13Regular.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: widget.productEntity.ratingCount.toString(),
                            style: AppTextStyles.body13Regular.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: ')',
                            style: AppTextStyles.body13Regular.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'المراجعة',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: App_colors.primarycolor,
                        decoration: TextDecoration.underline,
                        decorationColor: App_colors.primarycolor,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 9),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً",
                  style: AppTextStyles.body13Regular.copyWith(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
              SizedBox(height: 9),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    FruitFeatureContainer(
                      width: width,
                      height: height,
                      title: "عام",
                      subtitle: "الصلاحية",
                      svgPicture: SvgPicture.asset(Assets.images.calendar),
                    ),
                    Spacer(),
                    FruitFeatureContainer(
                      width: width,
                      height: height,
                      title: "100%",
                      subtitle: "اورجانيك",
                      svgPicture: SvgPicture.asset(Assets.images.lotus),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    FruitFeatureContainer(
                      width: width,
                      height: height,
                      title: "80 كالوري",
                      subtitle: "100 جرام",
                      svgPicture: SvgPicture.asset(Assets.images.vector),
                    ),
                    Spacer(),
                    FruitFeatureContainer(
                      width: width,
                      height: height,
                      title: "4.8",
                      subtitle: "تقييم",
                      svgPicture: SvgPicture.asset(Assets.images.favourites),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(text: "أضف الي السلة", onpress: () {

                  var cubit= context.read<CartCubit>();


                   cubit.cartEntity.getCartItem(widget.productEntity).count+=prouctCount-1;
                cubit.addproduct(widget.productEntity);
                   Navigator.pop(context);


                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitFeatureContainer extends StatelessWidget {
  const FruitFeatureContainer({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.svgPicture,
  });

  final double width;
  final double height;
  final String title;
  final String subtitle;
  final SvgPicture svgPicture;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.43,
      height: height * 0.1,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF1F1F5)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Column للنصوص
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body16Bold.copyWith(
                    color: App_colors.primarycolor,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTextStyles.heading13semiBold.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            // الأيقونة
            svgPicture,
          ],
        ),
      ),
    );
  }
}
