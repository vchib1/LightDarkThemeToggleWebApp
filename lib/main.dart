import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/pages/home_page.dart';
import 'package:light_dark_theme_toggle_web/pages/providers/theme_provider.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AppThemeProvider(pref: pref))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ScreenMode getLayoutType(double width) {
    if (width < 480) {
      return ScreenMode.mobile;
    } else if (width < 850) {
      return ScreenMode.tablet;
    } else {
      return ScreenMode.desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: provider.themeMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF98FB98)),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          home: LayoutBuilder(
            builder: (context, constraints) {
              return ScreenModeWidget(
                mode: getLayoutType(constraints.maxWidth),
                child: FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: HomePage(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
