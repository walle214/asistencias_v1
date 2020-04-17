import 'package:asistencias_v1/HttpServices.dart';
import 'package:asistencias_v1/models/grupos.dart';
import 'package:asistencias_v1/widgets/custom_widgets.dart';
import 'package:asistencias_v1/providers/provider_collection.dart';
import 'package:asistencias_v1/pages/pages_collection.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantelesPage extends StatelessWidget {
  const PlantelesPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    final providerDatosGrupos = Provider.of<DatosGrupos>(context);

    if (providerDatosGrupos.isEmpty) {
      HttpServices.getGrupos(context);
      return Center(child: CircularProgressIndicator());
    }
    final planteles = providerDatosGrupos.data.plantel;

    if (planteles.length == 0 || planteles == null)
      return Text('No hay grupos para mostrar');
    else if (planteles.length >= 1) {
      return _PlantelList(planteles: planteles);
    }
    return Container();
  }
}

class _PlantelList extends StatelessWidget {
  _PlantelList({@required this.planteles});

  final List<Plantel> planteles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: planteles.length,
      itemBuilder: (context, index) {
        final delay = index;
        final plantel = planteles[index];
        return LightBlueButton(
          plantel.nombre,
          (context) {
            _openCarreraPage(context, index, plantel.nombre);
          },
          delay: delay,
        );
      },
    );
  }
}

void _openCarreraPage(BuildContext context, int plantelIndex, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CarrerasPage(
        indexPlantel: plantelIndex,
        title: title,
      ),
    ),
  );
}
