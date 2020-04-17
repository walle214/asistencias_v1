import 'package:asistencias_v1/models/alumnos_list.dart';
import 'package:asistencias_v1/providers/DatosAlumnos.dart';
import 'package:asistencias_v1/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClaseData {
  final String _idGrupo;
  final String _idClase;
  final int _horas;
  int currentHour = 0;
  List<ButtonColorStatus> asistencias;

  ClaseData(
    this._idClase,
    this._idGrupo,
    this._horas,
  );
  set asistenciasLength(int length) {
    asistencias = List.filled(length,ButtonColorStatus.verde);
    //asistencias = asistencias.map((e) => e = ButtonColorStatus.verde).toList();
  }

  int get horas => _horas;

  AlumnosData getAlumnos(BuildContext context) {
    final alumnosProvider = Provider.of<DatosAlumnos>(context, listen: false);
    return alumnosProvider.getAlumnosData(_idGrupo);
  }
}
