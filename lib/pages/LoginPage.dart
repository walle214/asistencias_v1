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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Control de Asistencias',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: LightBlueButton(
                'Inciar sesión',
                (context) => Navigator.pushNamedAndRemoveUntil(
                    context, 'federationLogin', (route) => false),
                animate: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
