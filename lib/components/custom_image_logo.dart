import 'package:batur/utils/design_system.dart';
import 'package:flutter/material.dart';

class CustomImageLogo extends StatelessWidget {
  final double height;
  const CustomImageLogo({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Theme.of(context).brightness == Brightness.light
          ? MyImages.appLogoLight
          : MyImages.appLogoDark,
      height: height,
    );
  }
}
