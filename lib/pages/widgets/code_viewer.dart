import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';

class CustomCodeViewer extends StatelessWidget {
  final String code;
  final String language;

  const CustomCodeViewer({
    super.key,
    required this.code,
    this.language = 'dart',
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: code,
            style: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'monospace',
            ),
          ),
          textDirection: TextDirection.ltr,
          maxLines: null, // Allow wrapping
        );

        textPainter.layout(maxWidth: constraints.maxWidth);

        final height = textPainter.size.height;

        return Container(
          padding: const EdgeInsets.all(12.0),
          constraints: BoxConstraints(minHeight: height + 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceBright,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Wrap(
                    spacing: 5,
                    children: List.from(lightsColors).map((color) {
                      return CircleAvatar(radius: 5, backgroundColor: color);
                    }).toList(),
                  ),
                  Spacer(),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: code));

                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          showCloseIcon: true,
                          width: 250,
                          content: Text('Code copied to clipboard'),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.copy,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: HighlightView(
                  code,
                  language: language,
                  theme: codeTheme(context),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
