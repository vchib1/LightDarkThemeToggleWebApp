import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:light_dark_theme_toggle_web/pages/providers/theme_provider.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/custom_button.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final bool hasNotScrolled;

  const Header({super.key, required this.hasNotScrolled});

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    return AnimatedContainer(
      duration: 200.milliseconds,
      padding:
          EdgeInsets.symmetric(horizontal: screenMode.mainHorizontalPadding),
      decoration: BoxDecoration(
        color: hasNotScrolled
            ? Colors.transparent
            : Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: AppBar(
        toolbarHeight: headerHeight,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("LightDarkThemeToggle"),
        actions: [
          Consumer<AppThemeProvider>(
            builder: (context, value, child) {
              return Center(
                child: LightDarkThemeToggle(
                  themeIconType: ThemeIconType.expand,
                  duration: Duration(milliseconds: 350),
                  reverseDuration: Duration(milliseconds: 350),
                  value: value.themeMode == ThemeMode.dark,
                  onChanged: (_) => value.toggleTheme(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(headerHeight);
}
