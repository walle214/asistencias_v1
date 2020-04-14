import 'package:asistencias_v1/widgets/AppBarUDC.dart';

import 'package:asistencias_v1/widgets/custom_widgets.dart';

import 'package:flutter/material.dart';

class SimplePage extends StatelessWidget {
  final Widget child;
  final String appBarTitle;
  final String title;

  const SimplePage(
      {Key key,
      @required this.child,
      this.appBarTitle = 'Control de asistencias',
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppBarUDC(title: appBarTitle),
          title != null ? _PageTitle(title: title) : Container(),
          Expanded(child: child),
          Navigator.canPop(context) ? BackButtonBlue() : Container(),
        ],
      ),
    );
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
