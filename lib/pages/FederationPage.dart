import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FederationPage extends StatelessWidget {
  final Function onMessageReceived;
  final String initialUrl;

  const FederationPage(
      {Key key, @required this.initialUrl, @required this.onMessageReceived})
      : super(key: key);
  JavascriptChannel _loginJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Login',
      onMessageReceived: onMessageReceived,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SafeArea(
          child: WebView(
            initialUrl: initialUrl,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[
              _loginJavascriptChannel(context),
            ].toSet(),
            /*onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },*/
            gestureNavigationEnabled: true,
          ),
        ),
      ),
    );
  }
}
