import 'package:chat_app/core/utils/button_utils.dart';
import 'package:chat_app/core/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final double? buttonHeight;
  final String buttonTitle;
  final TextStyle? textStyle;
  final BoxDecoration? decoration;
  final double buttonPaddingH;
  final double buttonPaddingV;
  final double? leadingIconPaddingEnd;
  final double? trailingIconPaddingEnd;
  final double? iconH;
  final double? iconW;
  final String? leadingIconPath;
  final String? trailingIconPath;
  final Color? leadingIcTint;
  final Color? trailingIcTint;
  final double? icBorderRadius;
  final BoxFit iconFit;
  final bool isEnabled;

  const OutlinedButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.decoration,
    this.buttonHeight = 32,
    this.buttonPaddingH = 28,
    this.buttonPaddingV = 8,
    this.leadingIconPaddingEnd = 6,
    this.trailingIconPaddingEnd = 8,
    this.textStyle,
    this.iconH = 24,
    this.iconW = 24,
    this.leadingIconPath,
    this.trailingIconPath,
    this.leadingIcTint,
    this.trailingIcTint,
    this.icBorderRadius = 0,
    this.iconFit = BoxFit.cover,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      overlayColor: WidgetStateColor.resolveWith((state) => Colors.transparent),
      key: const Key('keyOutlinedBtnTap'),
      borderRadius: BorderRadius.circular(16),
      onTap: isEnabled ? onPressed : null,
      child: FittedBox(
        child: Container(
            height: buttonHeight,
            padding: EdgeInsets.symmetric(
                vertical: buttonPaddingV, horizontal: buttonPaddingH),
            decoration: decoration ?? ButtonUtils.defaultDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leadingIconPath != null && leadingIconPath!.isNotEmpty)
                  ImageWidget(
                    key: const Key('keyOutlinedBtnLeadingImg'),
                    imagePath: leadingIconPath!,
                    imgHeight: iconH,
                    imgWidth: iconW,
                    borderRadius: icBorderRadius,
                    tintColour: leadingIcTint,
                    boxFit: iconFit,
                  ),
                Padding(
                  padding: EdgeInsets.only(
                      left: leadingIconPaddingEnd ?? 6,
                      right: trailingIconPaddingEnd ?? 8),
                  child: Text(
                    key: const Key('keyOutlinedBtnTitleTxt'),
                    buttonTitle,
                    style: textStyle,
                  ),
                ),
                if (trailingIconPath != null && trailingIconPath!.isNotEmpty)
                  ImageWidget(
                    key: const Key('keyOutlinedBtnTrailingImg'),
                    imagePath: trailingIconPath!,
                    imgHeight: iconH,
                    imgWidth: iconW,
                    borderRadius: icBorderRadius,
                    tintColour: trailingIcTint,
                    boxFit: iconFit,
                  )
              ],
            )),
      ),
    );
  }
}
