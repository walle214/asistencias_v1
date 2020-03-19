import 'package:flutter/material.dart';

import 'CustomColors.dart';

Widget appBarUDC({title = 'Control de asistencias'}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: CustomColors.green,
    title: Text(title),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          // borderRadius: BorderRadius.circular(15.0),
          onTap: () => print('Taped2'),
          child: Chip(
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: CustomColors.red,
            avatar: CircleAvatar(
                backgroundColor: CustomColors.red,
                child: Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                )),
            label: Text('Salir'),
          ),
        ),
      ),
    ],
  );
}
