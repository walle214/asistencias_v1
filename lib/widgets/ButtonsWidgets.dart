import 'package:animate_do/animate_do.dart';
import 'package:asistencias_v1/widgets/CustomColors.dart';
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

abstract class LightBlueButton extends StatelessWidget {

  void onPresed(BuildContext context);


  final String textButton;
  final int delay;

  // final Map<String, dynamic> params;
  // final Function callBack;

  LightBlueButton({@required this.textButton, @required this.delay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: FadeInLeftBig(
        delay: Duration(milliseconds: delay),
        child: FlatButton(
          color: CustomColors.blue,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              textButton,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w800),
            ),
          ),
          onPressed: ()=>onPresed(context),
        ),
      ),
    );
  }
}
