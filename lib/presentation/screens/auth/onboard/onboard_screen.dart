import 'package:chat_app/core/constants/app_constants.dart';
import 'package:chat_app/core/constants/app_sizes.dart';
import 'package:chat_app/core/constants/image_paths.dart';
import 'package:chat_app/core/widgets/custom_gradient_button.dart';
import 'package:chat_app/core/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import '../../../../config/theme/colors.dart';
class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  Widget buildBottomContainer() {
    return Column(
      children: [
        ImageWidget(imagePath: ImagePaths.onBoardBg, boxFit: BoxFit.contain),
        SizedBox(height: AppSizes.size20),
        Text(AppConstants.onBoardMsg, textAlign: TextAlign.center)
      ],
    );
  }

  Widget buildBottom() {
    return Column(
      children: [
        Text(AppConstants.termsAndPrivacy, textAlign: TextAlign.center),
        SizedBox(height: AppSizes.size10),
        CustomGradientButton(
          onPressed: () {},
          text: AppConstants.startMessaging,
          textStyle: TextStyle(
              color: AppColors.whiteFeather, fontWeight: FontWeight.bold),
          gradientColors: [AppColors.primaryBlue, AppColors.primaryBlue],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: EdgeInsets.only(
                top: AppSizes.size100,
                left: AppSizes.size50,
                right: AppSizes.size50,
                bottom: AppSizes.size30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...[buildBottomContainer()],
                buildBottom()
              ],
            )),
      ),
    );
  }
}
