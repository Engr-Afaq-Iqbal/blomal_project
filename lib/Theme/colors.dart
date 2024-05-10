import 'package:flutter/material.dart';

Color primaryBlueColor = const Color(0xff5271FB);
Color primaryBlueGradientDarkColor = const Color(0xff314395);
Color secDarkBlueNavyColor = const Color(0xff415364);
Color secDarkGreyIconColor = const Color(0xff292D32);
Color secBorderColor = const Color(0xffDEE4FF);
Color kWhite = Colors.white;
Color kFFFFFF = const Color(0xffFFFFFF);
Color kDBE9F3 = const Color(0xffDBE9F3);
Color kBCC8FF = const Color(0xffBCC8FF);

/// Returns MaterialColor from Color
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

Color getFillColor(Set<MaterialState> states) {
  // Check if the checkbox is checked
  if (states.contains(MaterialState.selected)) {
    // If checked, return the active color
    return primaryBlueColor;
  } else {
    // If not checked, return grey
    return Colors.grey;
  }
}
