import 'package:flutter/material.dart';

extension StringColors on String {
  Color? get asColor {
    try {
      final stringColor = replaceAll("#", "");
      final colorInt = int.parse(stringColor, radix: 16) + 0xff000000;
      return Color(colorInt);
    } catch (_) {
      return null;
    }
  }
}

extension HexColor on Color {
  int get intAlpha => _floatToInt8(a);
  int get intRed => _floatToInt8(r);
  int get intGreen => _floatToInt8(g);
  int get intBlue => _floatToInt8(b);

  int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true, bool includeAlpha = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${includeAlpha ? intAlpha.toRadixString(16).padLeft(2, '0') : ''}'
      '${intRed.toRadixString(16).padLeft(2, '0')}'
      '${intGreen.toRadixString(16).padLeft(2, '0')}'
      '${intBlue.toRadixString(16).padLeft(2, '0')}';
}
