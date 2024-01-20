import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors {
  // Light Mode
  static const Color primaryLight = Color(0xFF1F3C88);
  static const Color secondaryLight = Color(0xFFECBC55);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color neutralLight = Color(0xFF2B2A31);
  static const Color technicalLight = Color(0xFF535474);
  static const Color infoLight = Color(0xFF3D9EE9);
  static const Color successLight = Color(0xFF41C97C);
  static const Color warningLight = Color(0xFFE5AF0C);
  static const Color dangerLight = Color(0xFFC92B2B);

  // Dark Mode
  static const Color primaryDark = Color(0xFF5893D4);
  static const Color secondaryDark = Color(0xFFF2CB78);
  static const Color backgroundDark = Color(0xFF141417);
  static const Color neutralDark = Color(0xFFE0DEEA);
  static const Color technicalDark = Color(0xFF7E7F96);
  static const Color infoDark = Color(0xFF6BB4ED);
  static const Color successDark = Color(0xFF6CE4A0);
  static const Color warningDark = Color(0xFFF0C544);
  static const Color dangerDark = Color(0xFFDA5353);
}

class MyTextStyles {
  static TextStyle headings1 = GoogleFonts.manrope(
    fontSize: 48,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headings2 = GoogleFonts.manrope(
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headings3 = GoogleFonts.manrope(
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headings4 = GoogleFonts.manrope(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headings5 = GoogleFonts.manrope(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitle1 = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subtitle2 = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle paragraph1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle paragraph2 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle paragraph3 = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle quotes = GoogleFonts.roboto(
    fontSize: 18,
    fontStyle: FontStyle.italic,
  );

  static TextStyle label = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle placeholder = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle assistive = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle button = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonLinks = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonSmall = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonExtraSmall = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle caption = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle overline = GoogleFonts.manrope(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}

class MyImages {
  // Light Mode
  static const String appLogoLight = "assets/logo/logo.png";

  // Dark Mode
  static const String appLogoDark = "assets/logo/logo_dark.png";

  // All Mode
  static const String onBoarding = "assets/images/onboarding.png";
}
