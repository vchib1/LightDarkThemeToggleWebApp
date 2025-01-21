import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:light_dark_theme_toggle_web/model/icon_model.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/hover_effect.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';

class StackCard extends StatelessWidget {
  const StackCard({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = const Duration(milliseconds: 300);

    final screenMode = ScreenModeWidget.of(context);

    final size = switch (screenMode) {
      ScreenMode.mobile => 150.0,
      ScreenMode.tablet => 175.0,
      ScreenMode.desktop => 250.0,
    };

    final rotation = switch (screenMode) {
      ScreenMode.mobile => 0.25,
      ScreenMode.tablet => 0.20,
      ScreenMode.desktop => 0.20,
    };

    return Stack(
      children: [
        ...IconModel.colors.mapIndexed(
          (index, color) {
            return Transform.rotate(
              angle: (IconModel.colors.length - 1 - index) * rotation,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).shadowColor, blurRadius: 0.5)
                  ],
                ),
                height: size,
                width: size,
                child: HoverEffect(
                  duration: duration,
                  reverseDuration: duration,
                  builder: (context, controller, child) {
                    return AbsorbPointer(
                      child: LightDarkThemeToggle(
                        color: Colors.black,
                        themeIconType: ThemeIconType.innerMoon,
                        size: size * 0.50,
                        value: controller.value == 0 ? false : true,
                        onChanged: (value) {},
                      ),
                    );
                  },
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
