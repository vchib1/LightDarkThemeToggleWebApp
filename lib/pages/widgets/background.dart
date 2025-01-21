import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final double dotSize;
  final Color? dotColor;
  final double spacing;

  final Widget child;

  const BackgroundWidget({
    super.key,
    required this.child,
    this.dotSize = 2.0,
    this.dotColor,
    this.spacing = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: DotsGridPainter(
        dotSize: dotSize,
        dotColor: dotColor ??
            Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.125),
        spacing: spacing,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [0.0, 1.0],
            colors: [
              Colors.transparent,
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      ),
    );
  }
}

class DotsGridPainter extends CustomPainter {
  final double dotSize;
  final Color dotColor;
  final double spacing;

  DotsGridPainter({
    required this.dotSize,
    required this.dotColor,
    required this.spacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x - spacing, y), dotSize / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
