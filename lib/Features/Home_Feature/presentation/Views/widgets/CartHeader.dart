
import 'package:flutter/cupertino.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric( vertical: 10),

      decoration: BoxDecoration(
        color: const Color(0xFFEBF9F1) /* Green1-50 */,
      ),
      child: Center(
        child: Text(
          'لديك 1 منتجات في سله التسوق',
          style: TextStyle(
            color: const Color(0xFF1B5E37) /* Green1-500 */,
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            height: 1.60,
          ),
        ),
      ),
    );
  }
}