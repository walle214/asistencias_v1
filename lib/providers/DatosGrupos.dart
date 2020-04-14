import 'package:asistencias_v1/models/grupos.dart';
import 'package:flutter/material.dart';

class DatosGrupos with ChangeNotifier {
  GruposData data;
  DatosGrupos() {
    this.data = null;
  }
  bool get isEmpty => this.data == null;

  void clear() => this.data = null;

  void notify() => notifyListeners();

  void initGruposData(String rawString) {
    // print(rawString);
    data = GruposData.fromRawJson(rawString);
    notifyListeners();
  }
}
