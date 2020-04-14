import 'package:asistencias_v1/models/alumnos_list.dart';
import 'package:asistencias_v1/widgets/custom_widgets.dart';

class ClaseData {
  final String idGrupo;
  final String idClase;
  final int horas;
  int currentHour = 0;
  AlumnosData _alumnos;
  List<ButtonColorStatus> asistencias;

  ClaseData({
    this.idGrupo,
    this.idClase,
    this.horas,
  });
  set alumnos(AlumnosData alumnos) {
    this._alumnos = alumnos;
    asistencias = List(alumnos.alumnos.length);
    asistencias = asistencias.map((e) => e = ButtonColorStatus.verde).toList();
  }

  AlumnosData get alumnos => _alumnos;
}
