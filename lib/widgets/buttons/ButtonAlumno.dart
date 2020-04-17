import 'package:animate_do/animate_do.dart';
import 'package:asistencias_v1/providers/provider_collection.dart';
import 'package:asistencias_v1/widgets/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  Color color, darkColor;

  ButtonColorStatus colorEnum;

  IconData iconData;

  ButtonAlumnoState({this.colorEnum});

  @override
  Widget build(BuildContext context) {
    selectColors();
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0, right: 15.0, left: 15.0),
      child: Material(
        color: color,
        child: InkWell(
          onTap: clickHandler,
          child: Container(
            height: 58.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      widget.alumnoName,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      color: darkColor,
                      width: 58.0,
                      height: 58.0,
                    ),
                    Positioned(
                      top: 8.0,
                      left: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                      child: Container(
                        height: 42.0,
                        width: 42.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 11.0,
                      left: 12.0,
                      bottom: 12.0,
                      right: 12.0,
                      child: Icon(
                        iconData,
                        color: darkColor,
                        size: 34.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clickHandler() {
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
  }

  void selectColors() {
    switch (colorEnum) {
      case ButtonColorStatus.rojo:
        color = CustomColors.red;
        darkColor = CustomColors.darkRed;
        iconData = FontAwesomeIcons.times;
        break;
      case ButtonColorStatus.amarillo:
        color = CustomColors.yellow;
        darkColor = CustomColors.darkYellow;
        iconData = FontAwesomeIcons.solidClock;
        break;
      case ButtonColorStatus.verde:
        color = CustomColors.green;
        darkColor = CustomColors.darkGreen;
        iconData = FontAwesomeIcons.check;
        break;
      case ButtonColorStatus.azul:
        color = CustomColors.blue;
        darkColor = CustomColors.lowDarkBlue;
        iconData = FontAwesomeIcons.stickyNote;
        break;
    }
  }
}
