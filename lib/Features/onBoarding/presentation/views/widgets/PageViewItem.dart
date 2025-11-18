import 'package:ecommerce_app/Features/Auth/presentation/Views/Login_page.dart';
import 'package:ecommerce_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:ecommerce_app/constants.dart';

import '../../../../../generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  final String image, backgroundimage;
  final String subtitle;
  final Widget title;
  final bool isvisible;

  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundimage,
    required this.subtitle,
    required this.title, required this.isvisible,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundimage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible:isvisible ,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {
                      SharedPrefernceSinglton.setBool(KisOnBoardingSeen, true);
                      Navigator.pushReplacementNamed(context, LoginPage.routename);
                    },
                      child: Text(S.of(context).skip)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 65,),
        title,
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(subtitle,style: AppTextStyles.heading13semiBold.copyWith(color: Color(0xff4E5556)),),
        )

      ],
    );
  }
}
