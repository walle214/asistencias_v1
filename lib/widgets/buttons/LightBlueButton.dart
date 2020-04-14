import 'package:asistencias_v1/config.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:asistencias_v1/widgets/CustomColors.dart';

typedef LightBlueCallBack = void Function(BuildContext context);

class LightBlueButton extends StatelessWidget {
  //void onPresed(BuildContext context);

  final LightBlueCallBack callBack;
  final String textButton;
  final int delay;
  final bool animate;

  LightBlueButton(
    this.textButton,
    this.delay,
    this.callBack, {
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0, right: 10.0, left: 10.0),
      child: animate
          ? FadeInLeftBig(
              delay: Duration(milliseconds: delay * delayButtons),
              child: _buildRaisedButton(context),
            )
          : _buildRaisedButton(context),
    );
  }

  RaisedButton _buildRaisedButton(BuildContext context) {
    return RaisedButton(
      color: CustomColors.blue,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          textButton,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),
        ),
      ),
      onPressed: () => callBack(context),
    );
  }
}
