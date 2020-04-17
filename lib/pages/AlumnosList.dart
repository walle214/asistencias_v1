import 'package:asistencias_v1/HttpServices.dart';
import 'package:asistencias_v1/widgets/custom_widgets.dart';
import 'package:asistencias_v1/providers/provider_collection.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlumnosList extends StatelessWidget {
  final String planelNombre;
  final String materiaNombre;
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
    this.planelNombre = '',
    this.materiaNombre = '',
  });

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: _body(context),
      title: planelNombre,
      subtitle: materiaNombre,
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
    final alumnos = clase.getAlumnos(context);
    if (alumnos == null) {
      HttpServices.getAlumnosList(context, idGrupo);
      return Center(child: CircularProgressIndicator());
    }
    final i = alumnos.alumnos.length;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: i + 1,
      itemBuilder: (context, index) {
        if (index < i) {
          final alumno = alumnos.alumnos[index];
          return ButtonAlumno(
            index: index,
            claseString: '$idGrupo-$idMateria',
            alumnoName: alumno.nombre,
            delay: index,
            color: clase.asistencias[index],
          );
        }
        return _SaveButton();
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.black54,
          indent: 20.0,
          height: 40.0,
        ),
        LightBlueButton(
          'Guardar Asistencias',
          (context) {},
          animate: false,
        ),
      ],
    );
  }
}
