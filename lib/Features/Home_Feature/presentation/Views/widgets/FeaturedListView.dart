
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'FeaturedItem.dart';

class Featuredlistview extends StatelessWidget {
  const Featuredlistview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:List.generate(4, (index){
          
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Featureditem(),
          );
        },),
      ),
    );
  }
}
