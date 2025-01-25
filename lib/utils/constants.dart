import 'package:flutter/material.dart';

const headerHeight = 60.0;
const footerHeight = 60.0;

final lightsColors = <Color>[
  Color(0xffff5d5e),
  Color(0xfffbbe27),
  Color(0xff2bc542),
];

Map<String, TextStyle> codeTheme(BuildContext context) {
  //final textTheme = Theme.of(context).textTheme;
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  // Define colors for light and dark themes
  final rootColor =
      isDarkMode ? const Color(0xffcccccc) : const Color(0xff333333);
  final commentColor =
      isDarkMode ? const Color(0xff7c7c7c) : const Color(0xff999988);
  final keywordColor =
      isDarkMode ? const Color(0xffd73a49) : const Color(0xff333333);
  final stringColor =
      isDarkMode ? const Color(0xff98c379) : const Color(0xffdd1144);
  final numberColor =
      isDarkMode ? const Color(0xff56b6c2) : const Color(0xff008080);
  final titleColor =
      isDarkMode ? const Color(0xffe06c75) : const Color(0xff990000);

  return {
    'root': TextStyle(
      color: rootColor,
      backgroundColor: Colors.transparent,
    ),
    'comment': TextStyle(color: commentColor, fontStyle: FontStyle.italic),
    'quote': TextStyle(color: commentColor, fontStyle: FontStyle.italic),
    'keyword': TextStyle(color: keywordColor, fontWeight: FontWeight.bold),
    'selector-tag': TextStyle(color: keywordColor, fontWeight: FontWeight.bold),
    'subst': TextStyle(color: rootColor, fontWeight: FontWeight.normal),
    'number': TextStyle(color: numberColor),
    'literal': TextStyle(color: numberColor),
    'variable': TextStyle(color: numberColor),
    'template-variable': TextStyle(color: numberColor),
    'string': TextStyle(color: stringColor),
    'doctag': TextStyle(color: stringColor),
    'title': TextStyle(color: titleColor, fontWeight: FontWeight.bold),
    'section': TextStyle(color: titleColor, fontWeight: FontWeight.bold),
    'selector-id': TextStyle(color: titleColor, fontWeight: FontWeight.bold),
    'type': TextStyle(color: numberColor, fontWeight: FontWeight.bold),
    'tag': TextStyle(color: rootColor, fontWeight: FontWeight.normal),
    'name': TextStyle(color: rootColor, fontWeight: FontWeight.normal),
    'attribute': TextStyle(color: rootColor, fontWeight: FontWeight.normal),
    'regexp': TextStyle(color: stringColor),
    'link': TextStyle(color: stringColor),
    'symbol': TextStyle(color: titleColor),
    'bullet': TextStyle(color: titleColor),
    'built_in': TextStyle(color: numberColor),
    'builtin-name': TextStyle(color: numberColor),
    'meta': TextStyle(color: commentColor, fontWeight: FontWeight.bold),
    'deletion': TextStyle(backgroundColor: const Color(0xffffdddd)),
    'addition': TextStyle(backgroundColor: const Color(0xffddffdd)),
    'emphasis': TextStyle(fontStyle: FontStyle.italic),
    'strong': TextStyle(fontWeight: FontWeight.bold),
  };
}

const installDependencies = '''dependencies:
  light_dark_theme_toggle: ^1.0.2
  ''';

const importPackage =
    '''import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
    ''';

const usageCode = '''import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: Text('Light/Dark Theme Toggle')),
        body: Center(
          child: LightDarkThemeToggle(
            value: false,
            // Initial value (false for dark, true for light)
            onChanged: (bool value) {
              // Handle theme change here.
            },
            size: 48.0,
            themeIconType: ThemeIconType.expand,
            color: Colors.orange,
            tooltip: 'Toggle Theme',
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }
}
''';
