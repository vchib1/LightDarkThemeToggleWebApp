import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/model/icon_model.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';

import 'icon_card.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    return Container(
      constraints: BoxConstraints(maxWidth: 1200),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Text(
            "Explore",
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: screenMode.contentSpacing,
            runSpacing: screenMode.contentSpacing,
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: IconModel.getIcons().map(
              (model) {
                return IconCard(iconModel: model);
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
