import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/background.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/header.dart';
import 'package:light_dark_theme_toggle_web/pages/widgets/main_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [Header()];
        },
        body: BackgroundWidget(child: MainContent()),
      ),
    );
  }
}
