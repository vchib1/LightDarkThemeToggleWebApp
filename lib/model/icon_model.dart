import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';

extension IterableExtension on Iterable {
  Iterable<T> mapIndexed<T>(T Function(int index, dynamic element) f) =>
      Iterable.generate(length).map((i) => f(i, elementAt(i)));
}

class IconModel {
  final ThemeIconType iconType;
  final String description;
  final Color backgroundColor;
  final int index;

  IconModel(this.iconType, this.description, this.index, this.backgroundColor);

  static List<String> descriptions = [
    "Classic sun and moon, representing day and night.",
    "Transition from day to night, with a crescent moon.",
    "A beautiful sun expanding to crescent moon",
    "A half-circle showing light and dark sides.",
    "A cool transition from day to night mimicking a eclipse.",
    "A sun split in half, for transitions like sunrise.",
    "A simple transition to form a crescent moon.",
    "A dark circle within a ring, focused and bold.",
  ];

  static List<Color> colors = [
    Color(0xFFFFD700), // Gold
    Color(0xFF87CEEB), // Sky Blue
    Color(0xFFFFA07A), // Light Salmon
    Color(0xFFFF69B4), // Hot Pink
    Color(0xFFFF6347), // Tomato Red
    Color(0xFFFF8C00), // Dark Orange
    Color(0xFFFFE4B5), // Moccasin
    Color(0xFF98FB98), // Pale Green
  ];

  static List<IconModel> getIcons() {
    return ThemeIconType.values
        .mapIndexed((index, icon) =>
            IconModel(icon, descriptions[index], index, colors[index]))
        .toList();
  }
}
