
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/App_TextStyles.dart';

class productsHeader extends StatelessWidget {
  const productsHeader({
    super.key, required this.numberOfProducts,
  });
  final int numberOfProducts;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${numberOfProducts} نتائج ',
          textAlign: TextAlign.right,
          style:AppTextStyles.body16Bold.copyWith(color:  Color(0xFF0C0D0D),
          ),
        ),
        Spacer(),
        Image.asset("assets/images/filter.png")
      ],
    );
  }
}
