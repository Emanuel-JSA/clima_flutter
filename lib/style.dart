import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClimaColors {
  static const Color black = Color(0xFF1E1E15);
  static const Color blue = Color(0xFF0E9094);
  static const Color red = Color(0xFFF85721);
  static const Color yellow = Color(0xFFF39708);

  static Color random() {
    List<Color> colors = [blue, red, yellow];
    return colors[Random().nextInt(colors.length)];
  }

  static Color basedOnTemp(double temp) {
    if (temp > 28) {
      return red;
    } else if (temp > 18) {
      return yellow;
    } else {
      return blue;
    }
  }
}

class FontSizes {
  static double get f10 => 10;
  static double get f11 => 11;
  static double get f12 => 12;
  static double get f14 => 14;
  static double get f16 => 16;
  static double get f20 => 20;
  static double get f24 => 24;
  static double get f32 => 32;
  static double get f48 => 48;
  static double get f52 => 52;
  static double get f172 => 172;
}


class TextStyles {
  static TextStyle fontFamily = TextStyle(fontFamily: GoogleFonts.asapCondensed().fontFamily, fontWeight: FontWeight.w400, height: 1);

  static TextStyle get display => fontFamily.copyWith(fontWeight: FontWeight.w500, fontSize: FontSizes.f172);
  static TextStyle get h1 =>
    fontFamily.copyWith(fontWeight: FontWeight.w600, fontSize: FontSizes.f48);
  static TextStyle get h2 => h1.copyWith(fontSize: FontSizes.f24);
  static TextStyle get h3 => h1.copyWith(fontSize: FontSizes.f20);
  static TextStyle get title1 => fontFamily.copyWith(fontWeight: FontWeight.bold, fontSize: FontSizes.f32);
  static TextStyle get title2 => title1.copyWith(fontWeight: FontWeight.w500, fontSize: FontSizes.f16);
  static TextStyle get body1 => fontFamily.copyWith(fontWeight: FontWeight.normal, fontSize: FontSizes.f16);
  static TextStyle get body2 => body1.copyWith(fontSize: FontSizes.f12);
  static TextStyle get body3 => body1.copyWith(fontSize: FontSizes.f12, fontWeight: FontWeight.bold);
}

class ButtonStyles {
  static ButtonStyle get startButton => FilledButton.styleFrom(
    backgroundColor: ClimaColors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );
}