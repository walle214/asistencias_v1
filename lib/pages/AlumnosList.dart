import 'package:asistencias_v1/HttpServices.dart';
import 'package:asistencias_v1/widgets/custom_widgets.dart';
import 'package:asistencias_v1/providers/provider_collection.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlumnosList extends StatelessWidget {
  final int indexPlantel;
  final int indexCarrera;
  final String idGrupo;
  final String idMateria;
  final int horas;
  AlumnosList({
    @required this.indexPlantel,
    @required this.indexCarrera,
    @required this.idGrupo,
    @required this.idMateria,
    @required this.horas,
  });

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final datosClasesProvider = Provider.of<DatosClases>(context);

    final clase = datosClasesProvider.getClaseData(
          idGrupo: idGrupo,
          idClase: idMateria,
        ) ??
        datosClasesProvider.addClaseData(
          horas: horas,
          idGrupo: idGrupo,
          idClase: idMateria,
        );
    final alumnos = clase.alumnos;
    if (alumnos == null) {
      HttpServices.getAlumnosList(context, idGrupo);
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: alumnos.alumnos.length,
      itemBuilder: (context, index) {
        final alumno = alumnos.alumnos[index];

        return ButtonAlumno(
          index: index,
          claseString: '$idGrupo-$idMateria',
          alumnoName: alumno.nombre,
          delay: index,
          color: clase.asistencias[index],
        );
      },
    );
  }
}
