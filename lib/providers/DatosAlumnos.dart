import 'package:asistencias_v1/models/alumnos_list.dart';
import 'package:flutter/material.dart';

class DatosAlumnos with ChangeNotifier {
  Map<String, AlumnosData> _data = Map();

  bool get isEmpty => this._data == null;

  void clear() => this._data = null;

  void notify() => notifyListeners();

  AlumnosData addAlumnosData(String rowData, String keyGrupo) {
    final alumnos = AlumnosData.fromRawJson(rowData);
    _data[keyGrupo] = alumnos;
    notifyListeners();
    return alumnos;
  }

  AlumnosData getAlumnosData(String keyGrupo) {
    return _data[keyGrupo];
  }
}
