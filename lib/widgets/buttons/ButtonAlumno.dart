import 'package:flutter/material.dart';

class ButtonAlumno extends StatefulWidget {
  final String alumnoName;
  final String color;
  ButtonAlumno({Key key, @required this.alumnoName, this.color = 'VERDE'})
      : super(key: key);

  @override
  ButtonAlumnoState createState() => ButtonAlumnoState();
}

class ButtonAlumnoState extends State<ButtonAlumno> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}
