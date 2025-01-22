import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/hover_effect.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? svgIcon;
  final void Function()? onPressed;

  const CustomButton(
      {super.key, required this.text, this.svgIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surfaceContainerHigh;
    final hoverColor = Theme.of(context).colorScheme.surface;

    return HoverEffect(
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 150),
      builder: (context, controller, child) {
        return GestureDetector(
          onTap: onPressed,
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: 200,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: controller.value == 0 ? hoverColor : backgroundColor,
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .outline
                    .withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                if (svgIcon != null)
                  SvgPicture.asset(
                    "assets/$svgIcon.svg",
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                Text(text, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        );
      },
    );
  }
}
