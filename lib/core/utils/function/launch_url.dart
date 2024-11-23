import 'package:url_launcher/url_launcher.dart';

import 'custom_snack_bar.dart';

Future<void> launchCustomUr(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      customSnackBar(context, 'URL launched successfully!', isError: false);
    } else {
      customSnackBar(context, 'Cannot launch $url', isError: true);
    }
  } else {
    customSnackBar(context, 'Invalid URL', isError: true);
  }
}