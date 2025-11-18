
import 'package:flutter/cupertino.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/gen/assets.gen.dart';

class Notification_Widget extends StatelessWidget {
  const Notification_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF8ED) ,
        shape: OvalBorder(),
      ),
      child:SvgPicture.asset(Assets.images.notification),
    );
  }
}
