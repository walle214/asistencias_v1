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
          padding: const EdgeInsets.only(right: 8.0),
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
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/',
        (route) => false,
      ),
      child: Chip(
        labelStyle: TextStyle(color: Colors.white),
        backgroundColor: CustomColors.red,
        avatar: CircleAvatar(
          backgroundColor: CustomColors.red,
          child: Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
        ),
        label: Text('Salir'),
      ),
    );
  }
}
// Widget appBarUDC({title}) {

// }
