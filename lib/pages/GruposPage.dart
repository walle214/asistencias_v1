import 'package:asistencias_v1/pages/AlumnosList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:asistencias_v1/widgets/custom_widgets.dart';
import 'package:asistencias_v1/providers/provider_collection.dart';

class GruposPage extends StatelessWidget {
  final int indexPlantel;
  final int indexCarrera;
  final String title;
  GruposPage(
      {@required this.indexCarrera, @required this.indexPlantel, this.title});
  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: _body(context),
      title: title,
    );
  }

  List<LightBlueButton> crearLista(BuildContext context) {
    int count = 0;
    final providerDatosGrupos = Provider.of<DatosGrupos>(context);

    final buttonsGruposIds = List<LightBlueButton>();

    final carrera =
        providerDatosGrupos.data.plantel[indexPlantel].carreras[indexCarrera];
    carrera.semestres.forEach(
      (semestre) {
        semestre.grupos.forEach(
          (grupo) {
            grupo.materias.forEach(
              (materia) {
                count++;
                final text =
                    '${semestre.nombre} ${grupo.nombre} - ${materia.nombre}';
                buttonsGruposIds.add(
                  LightBlueButton(
                    text,
                    (context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlumnosList(
                            planelNombre: title,
                            materiaNombre: text,
                            indexPlantel: indexPlantel,
                            indexCarrera: indexCarrera,
                            idGrupo: grupo.id,
                            idMateria: materia.id,
                            horas: int.parse(materia.horas),
                          ),
                        ),
                      );
                    },
                    delay: count,
                  ),
                );
              },
            );
          },
        );
      },
    );
    return buttonsGruposIds;
  }

  Widget _body(BuildContext context) {
    final listButtons = crearLista(context);

    return ListView.builder(
      itemCount: listButtons.length,
      itemBuilder: (context, index) => listButtons[index],
    );
  }
}
