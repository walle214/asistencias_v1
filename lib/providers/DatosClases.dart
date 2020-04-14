import 'package:asistencias_v1/models/alumnos_list.dart';
import 'package:asistencias_v1/models/clases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_collection.dart';

class DatosClases with ChangeNotifier {
  Map<String, ClaseData> clases = Map();

  ClaseData getClaseData({
    @required String idGrupo,
    @required String idClase,
  }) =>
      clases['$idGrupo-$idClase'];

  ClaseData addClaseData({
    @required int horas,
    @required String idGrupo,
    @required String idClase,
  }) {
    clases['$idGrupo-$idClase'] = clases['$idGrupo-$idClase'] ??
        ClaseData(
          horas: horas,
          idGrupo: idGrupo,
          idClase: idClase,
        );
    //notifyListeners();
    return clases['$idGrupo-$idClase'];
  }

  AlumnosData getAlumnosList(
    BuildContext context, {
    @required String idGrupo,
    @required String idClase,
  }) {
    final alumnosProvider = Provider.of<DatosAlumnos>(context);
    return alumnosProvider.getAlumnosData(idGrupo);
  }

  void addAlumnos(AlumnosData alumnosList, String grupoKey) {
    clases.keys.forEach((key) {
      final idGrupo = key.split('-')[0];
      if (grupoKey == idGrupo) clases[key].alumnos = alumnosList;
    });
    notifyListeners();
  }
}
