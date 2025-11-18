import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../../../../core/utils/gen/assets.gen.dart';
import '../../../domain/entites/bottomNavBarEntity.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChanged;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: currentIndex == index ? 3 : 2,
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              child: BottomNavBarItem(
                isSelected: currentIndex == index,
                bottomNavBaritem: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    Key? key,
    required this.isSelected,
    required this.bottomNavBaritem,
  }) : super(key: key);
  final bool isSelected;
  final bottomNavBarEntity bottomNavBaritem;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(
            image: bottomNavBaritem.activeImage,
            text: bottomNavBaritem.title,
          )
        : InActiveIcon(image: bottomNavBaritem.inActiveImage);
  }
}

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SvgPicture.asset(image, color: Colors.grey));
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({Key? key, required this.image, required this.text})
    : super(key: key);
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsetsGeometry.only(left: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37) /* Green1-500 */,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                color: const Color(0xFF1B5E37) /* Green1-500 */,
                fontSize: 11,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
