import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:light_dark_theme_toggle_web/utils/launch_url.dart';

import 'custom_button.dart';
import 'responsive_layout.dart';
import 'stack_card.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
    required this.titleStyle,
    required this.constraints,
    required this.descriptionStyle,
  });

  final BoxConstraints constraints;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    return Container(
      alignment: Alignment.center,
      child: ResponsiveLayout(
        spacing: 50,
        padding: screenMode.isMobile
            ? const EdgeInsets.only(top: 0)
            : EdgeInsets.zero,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: screenMode.isMobile ? null : constraints.maxHeight,
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: screenMode.isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toggle Theme in Flutter with Animated Icons",
                    style: titleStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "A Flutter package that provides 8 different animated icons to toggle between light and dark themes. Written purely in dart and CustomPainter for faster rendering and performance.",
                    style: descriptionStyle,
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      CustomButton(
                        text: "Get started",
                        onPressed: () => openLink(
                            "https://pub.dev/packages/light_dark_theme_toggle"),
                      ),
                      CustomButton(
                        text: "View on github",
                        svgIcon: "github-icon",
                        onPressed: () => openLink(
                            "https://github.com/vchib1/LightDarkThemeToggle"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                right: screenMode.isMobile ? 0 : 30,
              ),
              child: const StackCard(),
            ),
          )
        ],
      ),
    );
  }
}
