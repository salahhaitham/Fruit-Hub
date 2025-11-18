// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/apple_icon.svg
  String get appleIcon => 'assets/images/apple_icon.svg';

  /// Directory path: assets/images/bottomNav
  $AssetsImagesBottomNavGen get bottomNav => const $AssetsImagesBottomNavGen();

  /// File path: assets/images/facebook_icon.svg
  String get facebookIcon => 'assets/images/facebook_icon.svg';

  /// File path: assets/images/featuredItemBackground.svg
  String get featuredItemBackground =>
      'assets/images/featuredItemBackground.svg';

  /// File path: assets/images/featureditem2.svg
  String get featureditem2 => 'assets/images/featureditem2.svg';

  /// File path: assets/images/filter.png
  AssetGenImage get filter => const AssetGenImage('assets/images/filter.png');

  /// File path: assets/images/fliter.svg
  String get fliter => 'assets/images/fliter.svg';

  /// File path: assets/images/google_icon.svg
  String get googleIcon => 'assets/images/google_icon.svg';

  /// File path: assets/images/notification.svg
  String get notification => 'assets/images/notification.svg';

  /// File path: assets/images/pageViewItem1_image.svg
  String get pageViewItem1Image => 'assets/images/pageViewItem1_image.svg';

  /// File path: assets/images/pageviewItem2_background.svg
  String get pageviewItem2Background =>
      'assets/images/pageviewItem2_background.svg';

  /// File path: assets/images/pageviewItem2_image.svg
  String get pageviewItem2Image => 'assets/images/pageviewItem2_image.svg';

  /// File path: assets/images/pageviewitem1_backgroudimage.svg
  String get pageviewitem1Backgroudimage =>
      'assets/images/pageviewitem1_backgroudimage.svg';

  /// File path: assets/images/plant.svg
  String get plant => 'assets/images/plant.svg';

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/search-normal.svg
  String get searchNormal => 'assets/images/search-normal.svg';

  /// File path: assets/images/searchicon.svg
  String get searchicon => 'assets/images/searchicon.svg';

  /// File path: assets/images/searchicon2.svg
  String get searchicon2 => 'assets/images/searchicon2.svg';

  /// File path: assets/images/settings.svg
  String get settings => 'assets/images/settings.svg';

  /// File path: assets/images/splashIcon.svg
  String get splashIcon => 'assets/images/splashIcon.svg';

  /// File path: assets/images/splash_bottom.svg
  String get splashBottom => 'assets/images/splash_bottom.svg';

  /// File path: assets/images/trash.svg
  String get trash => 'assets/images/trash.svg';

  /// File path: assets/images/watermelon_test.png
  AssetGenImage get watermelonTest =>
      const AssetGenImage('assets/images/watermelon_test.png');

  /// List of all assets
  List<dynamic> get values => [
    appIcon,
    appleIcon,
    facebookIcon,
    featuredItemBackground,
    featureditem2,
    filter,
    fliter,
    googleIcon,
    notification,
    pageViewItem1Image,
    pageviewItem2Background,
    pageviewItem2Image,
    pageviewitem1Backgroudimage,
    plant,
    profile,
    searchNormal,
    searchicon,
    searchicon2,
    settings,
    splashIcon,
    splashBottom,
    trash,
    watermelonTest,
  ];
}

class $AssetsImagesBottomNavGen {
  const $AssetsImagesBottomNavGen();

  /// Directory path: assets/images/bottomNav/bold
  $AssetsImagesBottomNavBoldGen get bold =>
      const $AssetsImagesBottomNavBoldGen();

  /// File path: assets/images/bottomNav/category.svg
  String get category => 'assets/images/bottomNav/category.svg';

  /// File path: assets/images/bottomNav/home.svg
  String get home => 'assets/images/bottomNav/home.svg';

  /// File path: assets/images/bottomNav/shopping-cart.svg
  String get shoppingCart => 'assets/images/bottomNav/shopping-cart.svg';

  /// File path: assets/images/bottomNav/user.svg
  String get user => 'assets/images/bottomNav/user.svg';

  /// List of all assets
  List<String> get values => [category, home, shoppingCart, user];
}

class $AssetsImagesBottomNavBoldGen {
  const $AssetsImagesBottomNavBoldGen();

  /// File path: assets/images/bottomNav/bold/categories_bold.svg
  String get categoriesBold =>
      'assets/images/bottomNav/bold/categories_bold.svg';

  /// File path: assets/images/bottomNav/bold/home_bold.svg
  String get homeBold => 'assets/images/bottomNav/bold/home_bold.svg';

  /// File path: assets/images/bottomNav/bold/shopping-cart_bold.svg
  String get shoppingCartBold =>
      'assets/images/bottomNav/bold/shopping-cart_bold.svg';

  /// File path: assets/images/bottomNav/bold/user_bold.svg
  String get userBold => 'assets/images/bottomNav/bold/user_bold.svg';

  /// List of all assets
  List<String> get values => [
    categoriesBold,
    homeBold,
    shoppingCartBold,
    userBold,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
