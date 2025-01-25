import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/footer.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/usage_widget.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';
import 'explore_widget.dart';
import 'hero_widget.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final screenMode = ScreenModeWidget.of(context);

    final titleStyle = textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: screenMode.isMobileOrTablet ? 32 : 46,
    );
    final descriptionStyle = textTheme.bodyLarge!.copyWith(
      color: Colors.grey,
      fontWeight: FontWeight.w300,
      fontSize: screenMode.isMobileOrTablet ? 16 : 20,
      height: 1.5,
    );

    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenMode.mainHorizontalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hero Section
              if (screenMode.isMobileOrTablet)
                const SizedBox(height: headerHeight),
              HeroWidget(
                titleStyle: titleStyle,
                descriptionStyle: descriptionStyle,
                constraints: constraints,
              ),
              const SizedBox(height: 20),
              // Explore Section
              ExploreWidget(textTheme: textTheme),

              const SizedBox(height: 100),

              // Usage Section
              UsageWidget(
                textTheme: textTheme,
                descriptionStyle: descriptionStyle,
              ),

              const SizedBox(height: 50),

              Footer(),
            ],
          ),
        ),
      );
    });
  }
}
