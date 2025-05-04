import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Lastinvitation';

  // Colors
  static const Color primaryColor = Colors.green;
  static const Color accentColor = Colors.greenAccent;
  static const Color neutralColor = Colors.grey;
  static const Color warningColor = Colors.red;
  static const Color vipColor = Colors.yellow;
  static const Color secondaryColor = Colors.blue;
  static const Color blackColor = Colors.black;
  static const Color backgroundColor = Colors.white;

  // Paddings and Radii
  static const double defaultPadding = 16.0;
  static const double cardRadius = 12.0;
  static const double borderRadius = 8.0;

  // Font Sizes
  static const double titleFontSize = 24.0;
  static const double subtitleFontSize = 18.0;
  static const double bodyFontSize = 16.0;
  static const double buttonFontSize = 16.0;
  static const double headerFontSize = 20.0;

  // EdgeInsets
  static const EdgeInsets defaultPaddingEdgeInsets = EdgeInsets.all(defaultPadding);

  // Text Styles
  static TextStyle get titleStyle => const TextStyle(
        fontSize: titleFontSize,
        fontWeight: FontWeight.bold,
        color: blackColor,
      );

  static TextStyle get subtitleStyle => const TextStyle(
        fontSize: subtitleFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      );

  static TextStyle get bodyStyle => const TextStyle(
        fontSize: bodyFontSize,
        fontWeight: FontWeight.normal,
        color: Colors.black54,
      );

  static TextStyle get buttonStyle => const TextStyle(
        fontSize: buttonFontSize,
        fontWeight: FontWeight.bold,
        color: backgroundColor,
      );

  static TextStyle get headerStyle => const TextStyle(
        fontSize: headerFontSize,
        fontWeight: FontWeight.normal,
        color: backgroundColor,
      );

  static TextStyle get headerBoldStyle => const TextStyle(
        fontSize: headerFontSize,
        fontWeight: FontWeight.bold,
        color: backgroundColor,
      );
}