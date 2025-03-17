import 'package:flutter/material.dart';

import 'image_widget.dart';

/// CustomGradientButton
///
/// Customizable Gradient Button and Simple Button with/without icons.

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.decoration,
    this.buttonStyle,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPaddingSize = const Size(0, 0),
    this.textStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.leadingImage,
    this.leadingImageSize = const Size(16, 16),
    this.leadingImageColor,
    this.leadingImageColorFilter,
    this.trailingImage,
    this.trailingImageSize = const Size(16, 16),
    this.trailingImageColor,
    this.trailingImageColorFilter,
    this.textImageSpacing = 6,
    this.isDisabled = false,
    this.gradientColors,
    this.borderRadius = 35,
  });

  // Required properties
  final String text;
  final VoidCallback onPressed;

  // Optional properties
  final bool isDisabled;
  final Decoration? decoration;
  final ButtonStyle? buttonStyle;
  final double? buttonHeight;
  final double? buttonWidth;
  final Size buttonPaddingSize;
  final TextStyle textStyle;
  final String? leadingImage;
  final Size? leadingImageSize;
  final Color? leadingImageColor;
  final ColorFilter? leadingImageColorFilter;
  final String? trailingImage;
  final Size? trailingImageSize;
  final Color? trailingImageColor;
  final ColorFilter? trailingImageColorFilter;
  final double textImageSpacing;
  final List<Color>? gradientColors;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          key: const Key('keyCustomGradientBtn'),
          width: buttonWidth,
          height: buttonHeight,
          decoration: decoration ??
              BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors ?? [Colors.white, Colors.white],
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
          child: TextButton(
            onPressed: isDisabled ? null : onPressed,
            style: buttonStyle?.copyWith(
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: buttonPaddingSize.width,
                vertical: buttonPaddingSize.height,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leadingImage != null) ...[
                      _buildImage(
                        imageName: leadingImage!,
                        imageSize: leadingImageSize!,
                        color: leadingImageColor,
                        colorFilter: leadingImageColorFilter,
                      ),
                      SizedBox(width: textImageSpacing),
                    ],
                    Text(
                      key: const Key('keyGradientBtnTitleTxt'),
                      text,
                      style: textStyle,
                    ),
                    if (trailingImage != null) ...[
                      SizedBox(width: textImageSpacing),
                      _buildImage(
                        imageName: trailingImage!,
                        imageSize: trailingImageSize!,
                        color: trailingImageColor,
                        colorFilter: trailingImageColorFilter,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isDisabled)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildImage({
    required String imageName,
    required Size imageSize,
    Color? color,
    ColorFilter? colorFilter,
  }) {
    return ImageWidget(
      key: const Key('keyGradientBtnImg'),
      imagePath: imageName,
      imgHeight: imageSize.height,
      imgWidth: imageSize.width,
    );
  }
}
