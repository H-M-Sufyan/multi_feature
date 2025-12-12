import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final WebViewController _controller = WebViewController();
  int progress = 0;

  @override
  void initState() {
    _controller.loadRequest(Uri.parse('https://www.google.com/'));
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (value) {
          setState(() {
            progress = value;
          });
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi-Feature"), centerTitle: true),

      body: Column(
        children: [
          Visibility(
            visible: !(progress == 0 || progress == 100),
            child: LinearProgressIndicator(value: progress / 100),
          ),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}
