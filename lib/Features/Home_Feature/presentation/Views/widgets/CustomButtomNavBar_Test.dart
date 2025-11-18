import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavBar_Test extends StatefulWidget {
  const CustomBottomNavBar_Test({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar_Test> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar_Test> {
  int selectedIndex = 3;

  final List<IconData> icons = [
    FontAwesomeIcons.user,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.grip,
    FontAwesomeIcons.house,
  ];

  final List<String> labels = [
    'الحساب',
    'السلة',
    'الأقسام',
    'الرئيسية',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: isSelected
                  ? BoxDecoration(
                color: const Color(0x331B5E37),
                borderRadius: BorderRadius.circular(24),
              )
                  : null,
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: isSelected
                        ? const BoxDecoration(
                      color: Color(0xFF1B5E37),
                      shape: BoxShape.circle,
                    )
                        : null,
                    child: Center(
                      child: Icon(
                        icons[index],
                        color: isSelected
                            ? Colors.white
                            : Colors.grey[600],
                        size: 20,
                      ),
                    ),
                  ),
                  if (isSelected) const SizedBox(width: 8),
                  if (isSelected)
                    Text(
                      labels[index],
                      style: const TextStyle(
                        color: Color(0xFF1B5E37),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
          );
        }).reversed.toList(),
      ),
    );
  }
}
