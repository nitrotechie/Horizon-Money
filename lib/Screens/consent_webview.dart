import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConsentWebview extends StatefulWidget {
  const ConsentWebview({Key? key}) : super(key: key);

  @override
  _ConsentWebviewState createState() => _ConsentWebviewState();
}

class _ConsentWebviewState extends State<ConsentWebview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consent'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
      body: const WebView(
        initialUrl:
            "https://docs.setu.co/data/account-aggregator/fi-data-types",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
