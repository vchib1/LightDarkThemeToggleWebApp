import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/background.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/header.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/main_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool scrollPosIsAtTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Header(hasNotScrolled: scrollPosIsAtTop),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          setState(() {
            scrollPosIsAtTop = notification.metrics.pixels == 0 &&
                notification.metrics.axis == Axis.vertical;
          });

          return true;
        },
        child: BackgroundWidget(
          child: MainContent(),
        ),
      ),
    );
  }
}
