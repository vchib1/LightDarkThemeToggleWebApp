import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/model/icon_model.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/footer.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';
import 'package:light_dark_theme_toggle_web/utils/launch_url.dart';
import 'package:universal_code_viewer/universal_code_viewer.dart';
import 'custom_button.dart';
import 'icon_card.dart';
import 'responsive_layout.dart';
import 'stack_card.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final screenMode = ScreenModeWidget.of(context);

    final titleStyle = textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: screenMode.isMobileOrTablet ? 26 : 42,
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
              Container(
                alignment: Alignment.center,
                child: ResponsiveLayout(
                  spacing: 50,
                  padding: screenMode.isMobile
                      ? const EdgeInsets.only(top: 50)
                      : EdgeInsets.zero,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        height:
                            screenMode.isMobile ? null : constraints.maxHeight,
                        padding: const EdgeInsets.all(32),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              const SizedBox(height: 20),
              // Explore Section
              Container(
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
              ),

              const SizedBox(height: 100),

              // Code Snippet
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenMode.mainHorizontalPadding,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Code Snippet",
                      style: textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 30),
                    UniversalCodeViewer(
                      showLineNumbers: false,
                      codeLanguage: 'dart',
                      code: '''
LightDarkThemeToggle(
    value: false, // Initial value (false for dark, true for light)
    onChanged: (bool value) {
      // Handle theme change here.
    },
    size: 48.0,
    themeIconType: ThemeIconType.expand,
    color: Colors.black,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  ),
),
''',
                      style: Theme.of(context).brightness == Brightness.light
                          ? SyntaxHighlighterStyles.vscodeLight
                          : SyntaxHighlighterStyles.vscodeDark,
                    ),
                  ],
                ),
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
