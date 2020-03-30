import 'package:flutter/material.dart';

import 'package:asistencias_v1/widgets/custom_widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 120,
              image: AssetImage(
                'assets/ucolLogos/ucol80.png',
              ),
            ),
            Text(
              'Control de Asistencias',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: double.infinity,
              child: _LoginButton(
                'Inciar sesión',
                0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends LightBlueButton {
  _LoginButton(String textButton, int delay) : super(textButton, delay);

  @override
  void onPresed(BuildContext context) {
    // final waifu = Provider.of<DatosFederacion>(context);

    // if (waifu.isEmpty)
    Navigator.pushNamedAndRemoveUntil(
        context, 'federationLogin', (route) => false);
    // else
    //   Navigator.pushNamedAndRemoveUntil(context, 'plantel', (route) => false);
  }
}
