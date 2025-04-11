import 'package:flutter/material.dart';
import 'package:extension_flutter_tools/extension_flutter_tools.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Test HTML color conversion', () {
    expect("FF0000".asColor, const Color.fromARGB(255, 255, 0, 0));
    expect("00FF00".asColor, const Color.fromARGB(255, 0, 255, 0));
    expect("0000FF".asColor, const Color.fromARGB(255, 0, 0, 255));
  });

  test('Test HTML color conversion with leading #', () {
    expect("#FF0000".asColor, const Color.fromARGB(255, 255, 0, 0));
    expect("#00FF00".asColor, const Color.fromARGB(255, 0, 255, 0));
    expect("#0000FF".asColor, const Color.fromARGB(255, 0, 0, 255));
  });

  test('Test Color toHex without alpha', () {
    expect(const Color.fromARGB(255, 255, 0, 0).toHex(includeAlpha: false),
        "#ff0000");
    expect(const Color.fromARGB(255, 0, 255, 0).toHex(includeAlpha: false),
        "#00ff00");
    expect(const Color.fromARGB(255, 0, 0, 255).toHex(includeAlpha: false),
        "#0000ff");
  });

  test('Test Color toHex with alpha', () {
    expect(const Color.fromARGB(128, 255, 0, 0).toHex(includeAlpha: true),
        "#80ff0000");
    expect(const Color.fromARGB(128, 0, 255, 0).toHex(includeAlpha: true),
        "#8000ff00");
    expect(const Color.fromARGB(128, 0, 0, 255).toHex(includeAlpha: true),
        "#800000ff");
  });

  test('Test Color toHex without leading hash sign', () {
    expect(
        const Color.fromARGB(255, 255, 0, 0)
            .toHex(leadingHashSign: false, includeAlpha: false),
        "ff0000");
    expect(
        const Color.fromARGB(255, 0, 255, 0)
            .toHex(leadingHashSign: false, includeAlpha: false),
        "00ff00");
    expect(
        const Color.fromARGB(255, 0, 0, 255)
            .toHex(leadingHashSign: false, includeAlpha: false),
        "0000ff");
  });

  test('Test Color toHex with alpha and without leading hash sign', () {
    expect(
        const Color.fromARGB(128, 255, 0, 0)
            .toHex(leadingHashSign: false, includeAlpha: true),
        "80ff0000");
    expect(
        const Color.fromARGB(128, 0, 255, 0)
            .toHex(leadingHashSign: false, includeAlpha: true),
        "8000ff00");
    expect(
        const Color.fromARGB(128, 0, 0, 255)
            .toHex(leadingHashSign: false, includeAlpha: true),
        "800000ff");
  });
}
