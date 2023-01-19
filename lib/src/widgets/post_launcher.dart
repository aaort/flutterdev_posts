import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

const _domain = 'https://reddit.com';

class PostLauncher extends StatelessWidget {
  final String permalink;
  const PostLauncher({required this.permalink, super.key});

  /// Open post either in webview or default browser depending on platform
  Future<void> _redirectToPost() async {
    final uri = '$_domain$permalink';
    if (!await launchUrl(Uri.parse(uri))) {
      throw 'Can\'t open url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.open_in_new),
      tooltip: 'Redirect to post',
      onPressed: _redirectToPost,
    );
  }
}
