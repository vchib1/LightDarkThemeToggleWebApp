import 'package:url_launcher/url_launcher.dart';

void openLink(String url) async {
  try {
    if (!await canLaunchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
    await launchUrl(Uri.parse(url));
  } catch (_) {
    rethrow;
  }
}
