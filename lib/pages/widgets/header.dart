import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:light_dark_theme_toggle_web/pages/providers/theme_provider.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    return SliverPadding(
      padding:
          EdgeInsets.symmetric(horizontal: screenMode.mainHorizontalPadding),
      sliver: SliverAppBar(
        floating: true,
        title: Text("LightDarkThemeToggle"),
        actions: [
          Consumer<AppThemeProvider>(builder: (context, value, child) {
            return LightDarkThemeToggle(
              themeIconType: ThemeIconType.expand,
              duration: Duration(milliseconds: 350),
              reverseDuration: Duration(milliseconds: 350),
              value: value.themeMode == ThemeMode.dark,
              onChanged: (_) => value.toggleTheme(),
            );
          }),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(headerHeight);
}
