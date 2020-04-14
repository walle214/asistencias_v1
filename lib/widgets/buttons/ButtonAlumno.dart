import 'package:animate_do/animate_do.dart';
import 'package:asistencias_v1/providers/provider_collection.dart';
import 'package:asistencias_v1/widgets/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ButtonColorStatus { verde, rojo, azul, amarillo }

class ButtonAlumno extends StatefulWidget {
  final String alumnoName;
  final ButtonColorStatus color;
  final int delay;
  final int index;
  final String claseString;
  ButtonAlumno({
    Key key,
    @required this.alumnoName,
    this.color = ButtonColorStatus.verde,
    this.delay,
    this.index,
    this.claseString,
  }) : super(key: key);

  @override
  ButtonAlumnoState createState() => ButtonAlumnoState(colorEnum: color);
}

class ButtonAlumnoState extends State<ButtonAlumno> {
  Color color = CustomColors.green;

  ButtonColorStatus colorEnum;

  ButtonAlumnoState({this.colorEnum});

  @override
  Widget build(BuildContext context) {
    switch (colorEnum) {
      case ButtonColorStatus.rojo:
        color = CustomColors.red;
        break;
      case ButtonColorStatus.amarillo:
        color = CustomColors.yellow;
        break;
      case ButtonColorStatus.verde:
        color = CustomColors.green;
        break;
      case ButtonColorStatus.azul:
        color = CustomColors.blue;
        break;
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0, right: 10.0, left: 10.0),
      child: FadeInLeft(
        delay: Duration(milliseconds: widget.delay * 100),
        child: RaisedButton(
          color: color,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              widget.alumnoName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w800),
            ),
          ),
          onPressed: () {
            setState(
              () {
                switch (colorEnum) {
                  case ButtonColorStatus.rojo:
                    colorEnum = ButtonColorStatus.verde;
                    break;
                  case ButtonColorStatus.verde:
                    colorEnum = ButtonColorStatus.amarillo;
                    break;
                  case ButtonColorStatus.amarillo:
                    colorEnum = ButtonColorStatus.rojo;
                    break;
                  default:
                    break;
                }
              },
            );
            final idGrupo = widget.claseString.split('-')[0];
            final idClase = widget.claseString.split('-')[1];

            Provider.of<DatosClases>(context, listen: false)
                .getClaseData(idGrupo: idGrupo, idClase: idClase)
                .asistencias[widget.index] = colorEnum;
          },
        ),
      ),
    );
  }
}
