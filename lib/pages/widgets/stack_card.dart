import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:light_dark_theme_toggle_web/model/icon_model.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/hover_effect.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';

class StackCard extends StatefulWidget {
  const StackCard({super.key});

  @override
  State<StackCard> createState() => _StackCardState();
}

class _StackCardState extends State<StackCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    Timer(
      const Duration(milliseconds: 500),
      () {
        _controller.forward();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final duration = const Duration(milliseconds: 300);
    final screenMode = ScreenModeWidget.of(context);

    final size = switch (screenMode) {
      ScreenMode.mobile => 150.0,
      ScreenMode.tablet => 175.0,
      ScreenMode.desktop => 250.0,
    };

    final rotation = 0.2;

    return SizedBox(
      height: size,
      width: size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              ...IconModel.colors.mapIndexed(
                (index, color) {
                  return Transform.rotate(
                    angle: (IconModel.colors.length - 1 - index) *
                        rotation *
                        _animation.value,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            blurRadius: 0.5,
                          )
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
                            ).animate().fadeIn(delay: 300.ms, duration: 300.ms),
                          );
                        },
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
