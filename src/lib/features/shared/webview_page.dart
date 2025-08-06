import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Simple page that displays the given [url] inside a WebView.
class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
