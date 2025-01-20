import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/hover_effect.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surfaceContainerHigh;
    final hoverColor = Theme.of(context).colorScheme.surface;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HoverEffect(
        duration: const Duration(milliseconds: 150),
        reverseDuration: const Duration(milliseconds: 150),
        builder: (context, controller, child) {
          return Transform.scale(
            scale: Tween(begin: 1.0, end: 1.01).animate(controller).value,
            child: AnimatedContainer(
              height: 50,
              width: 150,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: controller.value == 0 ? hoverColor : backgroundColor,
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: 0.5)),
              ),
              child: Text(text),
            ),
          );
        },
      ),
    );
  }
}
