import 'package:asistencias_v1/widgets/AppBarUDC.dart';

import 'package:asistencias_v1/widgets/custom_widgets.dart';

import 'package:flutter/material.dart';

class SimplePage extends StatelessWidget {
  final Widget child;
  final String title;
  const SimplePage({
    Key key,
    @required this.child,
    this.title = 'Control de asistencias',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppBarUDC(title: this.title),
          Expanded(child: child),
          BackButtonBlue(),
        ],
      ),
    );
  }
}
