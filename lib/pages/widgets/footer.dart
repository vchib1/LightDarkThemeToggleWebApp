import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';
import 'package:light_dark_theme_toggle_web/utils/launch_url.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    final left = Text(
      "LightDarkThemeToggle",
      style: Theme.of(context).textTheme.bodyLarge,
    );

    final right = RichText(
      text: TextSpan(
        text: "Built with Flutter by ",
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: "Vivek Chib",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.blue,
                  decoration: TextDecoration.none,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => openLink("http://github.com/vchib1"),
          ),
        ],
      ),
    );

    return Container(
      height: footerHeight,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: switch (screenMode) {
        ScreenMode.mobile => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              left,
              right,
              const SizedBox(height: 10),
            ],
          ),
        ScreenMode.tablet || ScreenMode.desktop => Row(
            children: [
              left,
              Spacer(),
              right,
            ],
          ),
      },
    );
  }
}
