import 'package:flutter/material.dart';

import 'CustomColors.dart';

class AppBarUDC extends StatelessWidget {
  final String title;
  const AppBarUDC({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CustomColors.green,
      title: Text(title),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: 8.0,
            top: kToolbarHeight > 60 ? 20 : kToolbarHeight * .2,
            bottom: kToolbarHeight > 60 ? 20 : kToolbarHeight * .2,
          ),
          child: _ExitButton(),
        ),
      ],
    );
  }
}

class _ExitButton extends StatelessWidget {
  const _ExitButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.red),
      ),
      color: CustomColors.red,
      onPressed: () =>
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
      icon: Icon(
        Icons.power_settings_new,
        color: Colors.white,
      ),
      label: Text(
        'Salir',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
// Widget appBarUDC({title}) {

// }
