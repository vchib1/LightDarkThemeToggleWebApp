import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:light_dark_theme_toggle_web/model/icon_model.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/hover_effect.dart';

class IconCard extends StatefulWidget {
  final IconModel iconModel;

  const IconCard({
    super.key,
    required this.iconModel,
  });

  @override
  State<IconCard> createState() => _IconCardState();
}

class _IconCardState extends State<IconCard> {
  bool themeBool = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );
    final descriptionStyle = textTheme.bodyMedium!.copyWith(
      fontWeight: FontWeight.w400,
    );

    return LayoutBuilder(builder: (context, constraints) {
      return HoverEffect(
        duration: const Duration(milliseconds: 150),
        reverseDuration: const Duration(milliseconds: 150),
        builder: (context, controller, child) {
          return Transform.scale(
            scale: lerpDouble(1, 1.05, controller.value),
            child: PhysicalModel(
              elevation: 1.0,
              color: Theme.of(context).colorScheme.surface,
              shadowColor: Theme.of(context).shadowColor,
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                constraints: constraints,
                height: 300,
                width: 250,
                alignment: Alignment.center,
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: widget.iconModel.backgroundColor,
                        ),
                        child: LightDarkThemeToggle(
                          size: 150,
                          color: Colors.black,
                          curve: widget.iconModel.curve,
                          reverseCurve: widget.iconModel.curve,
                          themeIconType: widget.iconModel.iconType,
                          value: themeBool,
                          onChanged: (_) {
                            setState(() {
                              themeBool = !themeBool;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            widget.iconModel.iconType.name
                                    .substring(0, 1)
                                    .toUpperCase() +
                                widget.iconModel.iconType.name.substring(1),
                            style: titleStyle,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.iconModel.description,
                            style: descriptionStyle,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
