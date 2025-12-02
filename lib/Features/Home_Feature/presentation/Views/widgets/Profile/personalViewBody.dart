import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/ProfileFeature.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/persomalProfileView.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:ecommerce_app/core/utils/gen/assets.gen.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:svg_flutter/svg.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool isloading = false;
  File? fileimage;
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Center(child: Text("حسابي", style: AppTextStyles.body19Bold)),
                SizedBox(height: 16),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 80,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: fileimage != null
                              ? ClipOval(
                                  child: Image.file(
                                    fileimage!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: -15,
                          left: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () async {
                              setState(() => isloading = true);

                              try {
                                await pick_image();
                              } catch (e) {
                                log(e.toString());
                              }

                              setState(() => isloading = false);
                            },
                            child: Container(
                              width: 30, // نفس القيمة للطول والعرض
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, // الشكل الدائري الصحيح
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                size: 20,
                                color: App_colors.primarycolor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 24),
                    Column(
                      children: [
                        Text("salah haitham", style: AppTextStyles.body13Bold),
                        SizedBox(height: 2),
                        Text(
                          "salahhaism@gmail.com",
                          style: AppTextStyles.body13Regular.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 36),
                Text('عام', style: AppTextStyles.heading13semiBold),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, Personalprofileview.routename);
                  },
                  child: profile_Feature(
                    svgPicture: SvgPicture.asset(Assets.images.user),
                    ProfileFeatureText: "الملف الشخصي",
                  ),
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 2),
                SizedBox(height: 8),
                profile_Feature(
                  svgPicture: SvgPicture.asset(Assets.images.box),
                  ProfileFeatureText: "طلباتي",
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 2),
                SizedBox(height: 8),
                profile_Feature(
                  svgPicture: SvgPicture.asset(Assets.images.heart),
                  ProfileFeatureText: "المفضلة",
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 2),
                SizedBox(height: 8),
                profile_Feature(
                  svgPicture: SvgPicture.asset(Assets.images.notification),
                  ProfileFeatureText: "الاشعارات",
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 2),

               Spacer(),
               GestureDetector(
                 onTap: () {

                 },
                 child: Container(
                   height: 50,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: Color(0xffEBF9F1),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Spacer(flex: 2,),
                       Text(
                         'تسجيل الخروج',
                         textAlign: TextAlign.center,
                         style: AppTextStyles.heading13semiBold.copyWith(color: App_colors.primarycolor)
                       ),
                       Spacer(flex: 1,),
                       SvgPicture.asset(Assets.images.exit),
                       Spacer(flex: 1,),
                     ],
                   ),
                 ),
               ),
               Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pick_image() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        fileimage = File(image.path);
      });
    }
  }
}
