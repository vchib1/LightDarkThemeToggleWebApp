import 'package:flutter/material.dart';

class HoverEffect extends StatefulWidget {
  final double dx;
  final double dy;
  final MouseCursor cursor;
  final Widget? child;
  final Duration duration;
  final Duration reverseDuration;
  final Widget Function(
      BuildContext context, AnimationController controller, Widget? child)?
  builder;

  const HoverEffect({
    super.key,
    this.child,
    this.dx = -2.5,
    this.dy = -2.5,
    this.builder,
    this.duration = const Duration(milliseconds: 200),
    this.reverseDuration = const Duration(milliseconds: 200),
    this.cursor = SystemMouseCursors.click,
  });

  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null && widget.builder == null) {
      throw FlutterError('child cannot be null, pass a widget or use builder');
    }

    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => controller.forward(),
      onExit: (_) => controller.reverse(),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          if (widget.builder != null) {
            return widget.builder!(context, controller, widget.child);
          }

          return Transform.translate(
            offset: Offset(
              controller.value * widget.dx,
              controller.value * widget.dy,
            ),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
