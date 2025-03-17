import 'package:chat_app/core/utils/image_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatefulWidget {
  final String imagePath;
  final num? imgWidth;
  final num? imgHeight;
  final double? borderRadius;
  final Color? tintColour;
  final BoxFit? boxFit;
  final String? defaultImgPath;

  const ImageWidget(
      {super.key,
      required this.imagePath,
      this.imgWidth,
      this.imgHeight,
      this.borderRadius = 0,
      this.tintColour,
      this.boxFit,
      this.defaultImgPath = ''});

  @override
  State<ImageWidget> createState() => ImageWidgetState();
}

class ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      key: const Key('keyImage'),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      child: (widget.imagePath.isEmpty)
          ? _loadDefaultImage()
          : isSvgImage(widget.imagePath)
              ? loadSvgImage(
                  path: widget.imagePath,
                  width: widget.imgWidth,
                  height: widget.imgHeight,
                  tintColour: widget.tintColour,
                  boxFit: widget.boxFit,
                  defaultSvgPath: widget.defaultImgPath ?? '',
                )
              : loadImage(
                  path: widget.imagePath,
                  width: widget.imgWidth,
                  height: widget.imgHeight,
                  tintColour: widget.tintColour,
                  boxFit: widget.boxFit,
                  defaultImagePath: widget.defaultImgPath ?? '',
                ),
    );
  }

  Widget _loadDefaultImage() {
    if (widget.defaultImgPath?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }

    return isSvgImage(widget.defaultImgPath ?? '')
        ? SvgPicture.asset(
            widget.defaultImgPath!,
            width: widget.imgWidth?.toDouble(),
            height: widget.imgHeight?.toDouble(),
            fit: widget.boxFit ?? BoxFit.contain,
          )
        : Image.asset(
            widget.defaultImgPath!,
            width: widget.imgWidth?.toDouble(),
            height: widget.imgHeight?.toDouble(),
            fit: widget.boxFit ?? BoxFit.contain,
          );
  }

  bool isSvgImage(String? path) {
    return path?.endsWith('.svg') ?? false;
  }
}
