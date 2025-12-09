import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Notification/Notification_View.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/ProfileFeature.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/favorite_view/FavoriteProductsView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/ordersView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/Profile/persomalProfileView.dart';
import 'package:ecommerce_app/core/Helper_Functions/ShowSnackBar.dart';
import 'package:ecommerce_app/core/utils/App_TextStyles.dart';
import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:ecommerce_app/core/utils/gen/assets.gen.dart';
import 'package:ecommerce_app/core/widgets/Custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../core/Helper_Functions/getuser.dart';
import '../../../../manager/StoreprofileImg_Cubit/storeprofile_img_cubit.dart';

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
                child: ClipOval(
                  child: fileimage != null
                      ? Image.file(
                    fileimage!,
                    fit: BoxFit.cover,
                  )
                      : (getUser().profileImg != null
                      ? Image.network(
                    getUser().profileImg!,
                    fit: BoxFit.cover,
                  )
                      : Icon(Icons.person, size: 40)), // أيقونة افتراضية لو مفيش صورة
                ),

                      ),
                      Positioned(
                        bottom: -15,
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {


                            try {
                              await pick_image();
                              await context.read<StoreprofileImgCubit>().StoreprofileImg(fileimage!);


                            } catch (e) {
                              log(e.toString());
                            }


                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
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
                      Text(getUser().UserName, style: AppTextStyles.body13Bold),
                      SizedBox(height: 2),
                      Text(
                        getUser().email,
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Ordersview.routename);
                },
                child: profile_Feature(
                  svgPicture: SvgPicture.asset(Assets.images.box),
                  ProfileFeatureText: "طلباتي",
                ),
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey.shade300, thickness: 2),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                 Navigator.pushNamed(context, Favoriteproductsview.routename);
                },
                child: profile_Feature(
                  svgPicture: SvgPicture.asset(Assets.images.heart),
                  ProfileFeatureText: "المفضلة",
                ),
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey.shade300, thickness: 2),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, NotificationView.routename);
                },
                child: profile_Feature(
                  svgPicture: SvgPicture.asset(Assets.images.notification),
                  ProfileFeatureText: "الاشعارات",
                ),
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
