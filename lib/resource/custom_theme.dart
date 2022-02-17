import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData customTheme() {
  return ThemeData(
    textTheme: TextTheme(
      bodyText1: GoogleFonts.notoSans(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xFF47FF9C),
      titleTextStyle: GoogleFonts.notoSans(
        textStyle: TextStyle(
          fontSize: 35.0,
          color: Color(
            0xFF008C8C,
          ),
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(
        0xFF9932CC,
      ),
    ),
  );
}
