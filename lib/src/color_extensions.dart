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
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true, bool includeAlpha = true}) {
    int to255(double value) => (value * 255).round();

    final components = [
      if (includeAlpha) to255(a),
      to255(r),
      to255(g),
      to255(b),
    ];

    final hex =
        components.map((c) => c.toRadixString(16).padLeft(2, '0')).join();

    return '${leadingHashSign ? '#' : ''}$hex';
  }
}
