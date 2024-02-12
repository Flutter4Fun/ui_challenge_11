import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_challenge_11/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.bgColor = AppColors.homeIconsBg,
    this.fgColor = AppColors.homeIconsFg,
  });

  final String iconPath;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color fgColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          fgColor,
          BlendMode.srcIn,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          bgColor,
        ),
      ),
    );
  }
}
