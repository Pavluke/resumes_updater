import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required link}) : _link = link;
  final String _link;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late String appBarTitle;

  late final webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(widget._link))
    ..setNavigationDelegate(
      NavigationDelegate(
        onUrlChange: (UrlChange url) {},
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {
          setState(() {
            appBarTitle = url;
            if (url.endsWith('/?hhtmFrom=account_login')) {
              _loadPage();
            }
          });
        },
        onPageFinished: (String url) {
          setState(() {
            appBarTitle = url;
          });
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(widget._link)) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

  void _loadPage() {
    webViewController.loadRequest(Uri.parse('https://hh.ru/applicant/resumes'));
  }

  @override
  void initState() {
    appBarTitle = widget._link;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              appBarTitle,
              style: const TextStyle(fontSize: 10),
            ),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: WebViewWidget(
          controller: webViewController,
        ),
      ),
    );
  }
}
