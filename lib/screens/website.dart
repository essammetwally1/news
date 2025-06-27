import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteView extends StatefulWidget {
  final String urlAdd;

  const WebsiteView({super.key, required this.urlAdd});

  @override
  State<WebsiteView> createState() => _WebViewState();
}

class _WebViewState extends State<WebsiteView> {
  late final WebViewController controller;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.urlAdd),
      );
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
