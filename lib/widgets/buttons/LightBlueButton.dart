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
    this.callBack, {
    this.delay = 0,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0, right: 15.0, left: 15.0),
      child: animate
          ? ZoomIn(
              delay: Duration(milliseconds: delay * delayButtons),
              child: _buildRaisedButton(context),
            )
          : _buildRaisedButton(context),
    );
  }

  FlatButton _buildRaisedButton(BuildContext context) {
    return FlatButton(
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
