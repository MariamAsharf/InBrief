

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/my_theme/theme.dart';

class DarkTheme extends BaseLine {
  @override
  Color get backgroundColor => Color(0xFF171717);

  @override
  Color get primaryColor => Color(0xFFA0A0A0);

  @override
  Color get textColor => Color(0xFFFFFFFF);

  @override
  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          titleSmall: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w700, color: textColor),
          titleMedium: GoogleFonts.inter(
              fontSize: 20, fontWeight: FontWeight.w700, color: textColor),
          titleLarge: GoogleFonts.inter(
              fontSize: 24, fontWeight: FontWeight.w700, color: textColor),
          bodySmall: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w700, color: textColor),
        ),
      );
}
