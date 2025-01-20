import 'package:flutter/material.dart';
import 'package:light_dark_theme_toggle_web/utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      color: Colors.grey,
      height: footerHeight,
    );
  }
}
