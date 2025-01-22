import 'package:flutter/cupertino.dart';

enum ScreenMode {
  mobile,
  tablet,
  desktop;

  bool get isMobile => this == ScreenMode.mobile;

  bool get isTablet => this == ScreenMode.tablet;

  bool get isWeb => this == ScreenMode.desktop;

  bool get isMobileOrTablet =>
      this == ScreenMode.mobile || this == ScreenMode.tablet;

  double get contentSpacing => switch (this) {
        ScreenMode.mobile => 10,
        ScreenMode.tablet => 30,
        ScreenMode.desktop => 50,
      };

  double get mainHorizontalPadding => switch (this) {
        ScreenMode.mobile => 8,
        ScreenMode.tablet => 20,
        ScreenMode.desktop => 100,
      };
}

class ScreenModeWidget extends InheritedWidget {
  final ScreenMode mode;

  const ScreenModeWidget({super.key, required this.mode, required super.child});

  static ScreenMode of(BuildContext context) {
    final responsiveLayout =
        context.dependOnInheritedWidgetOfExactType<ScreenModeWidget>();

    if (responsiveLayout == null) {
      throw FlutterError('ScreenModeWidget not found in widget tree!');
    }
    return responsiveLayout.mode;
  }

  @override
  bool updateShouldNotify(covariant ScreenModeWidget oldWidget) {
    return oldWidget.mode != mode;
  }
}
