import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String defaultSvgAssetPath = ""; //todo add default svg path here

/// To check whether image is from network or not
bool isNetworkImage(String path) {
  return path.startsWith('http://') || path.startsWith('https://');
}

/// To check image whether it is svg or not
bool isSvgImage(String path) {
  return path.endsWith('.svg');
}

/// Loading svg image, in case of image path is empty or null load default svg image
Widget loadSvgImgAsset({
  String? assetPath,
  num? width,
  num? height,
  BoxFit? boxFit,
  Color? tintColour,
  required String defaultImagePath
}) {
  final imgPath = (assetPath == null || assetPath.isEmpty)
      ? defaultImagePath
      : assetPath;

  return SvgPicture.asset(
    imgPath,
    width: width?.toDouble(),
    height: height?.toDouble(),
    fit: boxFit ?? BoxFit.fill,
    colorFilter: tintColour != null
        ? ColorFilter.mode(tintColour, BlendMode.srcIn)
        : null,
  );
}

/// Loading images like jpg,png,webp etc, in case of image path is empty or null load default image
Widget loadDefaultImageAsset(
    {String? imgPath,
    num? width,
    num? height,
    BoxFit? boxFit,
    Color? tintColor,
    BlendMode? blendMode,
    required String defaultImagePath,}) {
  final path = (imgPath == null || imgPath.isEmpty) ? defaultImagePath : imgPath;

  return Image.asset(
    path,
    width: width?.toDouble(),
    height: height?.toDouble(),
    fit: boxFit ?? BoxFit.fill,
    color: tintColor,
    colorBlendMode: blendMode ?? BlendMode.srcIn,
  );
}

/// To Load svg images
Widget loadSvgImage({
  required String? path,
  num? width,
  num? height,
  Color? tintColour,
  BoxFit? boxFit,
  required String defaultSvgPath,
}) {
  String imgPath = path ?? defaultSvgPath;
  try {
    return isNetworkImage(imgPath)
        ? SvgPicture.network(
            imgPath,
            width: width?.toDouble(),
            height: height?.toDouble(),
            fit: boxFit ?? BoxFit.fill,
            colorFilter: tintColour != null
                ? ColorFilter.mode(tintColour, BlendMode.srcIn)
                : null,
          )
        : loadSvgImgAsset(
            assetPath: imgPath,
            defaultImagePath: defaultSvgPath,
            width: width,
            height: height,
            tintColour: tintColour,
            boxFit: boxFit,
          );
  } catch (e) {
    // Load default SVG asset on error
    return loadSvgImgAsset(
      defaultImagePath: defaultSvgPath,
      assetPath: defaultSvgPath,
      width: width,
      height: height,
      tintColour: tintColour,
      boxFit: boxFit,
    );
  }
}

/// Load images with .png or .webp or .jpg extension images
Widget loadImage({
  required String? path,
  num? width,
  num? height,
  Color? tintColour,
  BoxFit? boxFit,
  required String defaultImagePath,
}) {
  String imgPath = path ?? defaultImagePath;
  return isNetworkImage(imgPath)
      ? Image.network(
          imgPath,
          width: width?.toDouble(),
          height: height?.toDouble(),
          fit: boxFit ?? BoxFit.fill,
          color: tintColour,
          colorBlendMode: BlendMode.srcIn,
          errorBuilder: (context, error, stackTrace) {
            return loadDefaultImageAsset(
              imgPath: defaultImagePath,
              defaultImagePath: defaultImagePath,
              width: width?.toDouble(),
              height: height?.toDouble(),
              boxFit: boxFit ?? BoxFit.fill,
            );
          },
        )
      : loadDefaultImageAsset(
          imgPath: imgPath,
          defaultImagePath: defaultImagePath,
          width: width?.toDouble(),
          height: height?.toDouble(),
          boxFit: boxFit ?? BoxFit.fill,
          tintColor: tintColour,
          blendMode: BlendMode.srcIn,
        );
}
