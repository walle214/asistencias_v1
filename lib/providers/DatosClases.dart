import 'package:asistencias_v1/models/alumnos_list.dart';
import 'package:asistencias_v1/models/clases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_collection.dart';

class DatosClases with ChangeNotifier {
  Map<String, ClaseData> _clases = Map();

  ClaseData getClaseData({
    @required String idGrupo,
    @required String idClase,
  }) =>
      _clases['$idGrupo-$idClase'];

  ClaseData addClaseData({
    @required int horas,
    @required String idGrupo,
    @required String idClase,
  }) {
    _clases['$idGrupo-$idClase'] =
        _clases['$idGrupo-$idClase'] ?? ClaseData(idClase, idGrupo, horas);
    //notifyListeners();
    return _clases['$idGrupo-$idClase'];
  }

  AlumnosData getAlumnosList(
    BuildContext context, {
    @required String idGrupo,
    @required String idClase,
  }) {
    final alumnosProvider = Provider.of<DatosAlumnos>(context);
    return alumnosProvider.getAlumnosData(idGrupo);
  }

  void changeLength(int length, String grupoKey) {
    _clases.keys.forEach(
      (key) {
        final idGrupo = key.split('-')[0];
        if (grupoKey == idGrupo) _clases[key].asistenciasLength = length;
      },
    );
    notifyListeners();
  }
}
