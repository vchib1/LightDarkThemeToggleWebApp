import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'multi_view_app.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();

  runWidget(
    MultiViewApp(
      viewBuilder: (context) {
        return HomePage(pref);
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  final SharedPreferences pref;

  const HomePage(this.pref, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // for only the widget
  bool value = false;

  // for theme change
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    getDarkMode();
  }

  void getDarkMode() async {
    darkMode = widget.pref.getBool('darkMode') ?? false;
    setState(() {});
  }

  void toggleThemeMode() {
    setState(() => darkMode = !darkMode);
    widget.pref.setBool('darkMode', !darkMode);
  }

  void onChanged(bool value) {
    setState(() {
      this.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    int viewId = View.of(context).viewId;
    int iconTypeIndex = (viewId - 3).clamp(0, ThemeIconType.values.length - 1);

    final width = MediaQuery.sizeOf(context).width * .90;

    final widgetWidth = clampDouble(width, 20, 200);

    final isHeaderIcon = (viewId == 1);

    return MaterialApp(
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Center(
        child: LightDarkThemeToggle(
          color: isHeaderIcon ? null : Colors.black,
          size: isHeaderIcon ? null : widgetWidth,
          themeIconType: viewId == 1 || viewId == 2
              ? ThemeIconType.expand
              : ThemeIconType.values[iconTypeIndex],
          value: isHeaderIcon ? darkMode : value,
          onChanged: isHeaderIcon ? (_) => toggleThemeMode() : onChanged,
        ),
      ),
    );
  }
}
