import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/model/icon_model.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/footer.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';
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
      fontSize: screenMode.isMobileOrTablet ? 26 : 46,
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
                        height: constraints.maxHeight,
                        padding: const EdgeInsets.all(32),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Toggle Theme in Flutter\nwith Animated Icons",
                              style: titleStyle,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "A Flutter package that provides 8 different animated icons to toggle between light and dark themes. Written purely in dart and CustomPainter for faster rendering and performance.",
                              style: descriptionStyle,
                            ),
                            const SizedBox(height: 30),
                            Wrap(
                              children: [
                                CustomButton(text: "Get on pub.dev"),
                                CustomButton(text: "View on github"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(flex: 1, child: const StackCard())
                  ],
                ),
              ),
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
              const SizedBox(height: footerHeight),
              Footer(),
              const SizedBox(height: footerHeight / 4),
            ],
          ),
        ),
      );
    });
  }
}
