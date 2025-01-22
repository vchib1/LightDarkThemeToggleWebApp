import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:light_dark_theme_toggle_web/pages/home_page.dart';
import 'package:light_dark_theme_toggle_web/pages/providers/theme_provider.dart';
import 'package:light_dark_theme_toggle_web/screen_mode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();

  var loader = SvgAssetLoader("assets/svg/github-icon.svg");
  svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          title: 'LightDarkThemeToggle',
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
                child: HomePage()
                    .animate()
                    .fadeIn(duration: 400.milliseconds, curve: Curves.easeIn),
              );
            },
          ),
        );
      },
    );
  }
}
