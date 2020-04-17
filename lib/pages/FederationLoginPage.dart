import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:asistencias_v1/providers/DatosFederacion.dart';

class FederationLoginPage extends StatelessWidget {
  JavascriptChannel _loginJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Login',
      onMessageReceived: (JavascriptMessage message) {
        final waifuProvider =
            Provider.of<DatosFederacion>(context, listen: false);
        waifuProvider.initWaifuData(message.message);
        Navigator.pushNamedAndRemoveUntil(
          context,
          'plantel',
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SafeArea(
          child: WebView(
            initialUrl:
                'https://sistemas.cruzperez.com/flutter-asistencias/login.php',
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
