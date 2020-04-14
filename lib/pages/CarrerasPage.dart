import 'package:asistencias_v1/models/grupos.dart';
import 'package:asistencias_v1/pages/pages_collection.dart';
import 'package:asistencias_v1/providers/DatosGrupos.dart';

import 'package:asistencias_v1/widgets/custom_widgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrerasPage extends StatelessWidget {
  final String title;
  final int indexPlantel;
  const CarrerasPage({Key key, @required this.indexPlantel, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final datosGruposProvider =
        Provider.of<DatosGrupos>(context).data.plantel[indexPlantel];
    if (datosGruposProvider.carreras.length == 1)
      return GruposPage(
        indexCarrera: 0,
        indexPlantel: indexPlantel,
        title: datosGruposProvider.carreras[0].nombre ??
            datosGruposProvider.nombre,
      );
    return SimplePage(
      child: _body(context),
      title: title,
    );
  }

  Widget _body(BuildContext context) {
    final providerDatosGrupos = Provider.of<DatosGrupos>(context);

    if (providerDatosGrupos.isEmpty)
      Navigator.pushNamedAndRemoveUntil(context, 'plantel', (route) => false);

    final carreras = providerDatosGrupos.data.plantel[indexPlantel].carreras;
    if (carreras.length == 0 || carreras == null)
      return Text('No hay carreras para mostrar');
    else if (carreras.length >= 1)
      return _ListCarreras(
        carreras: carreras,
        indexPlantel: indexPlantel,
      );
    return Container();
  }
}

class _ListCarreras extends StatelessWidget {
  final List<Carrera> carreras;

  final int indexPlantel;

  _ListCarreras({
    @required this.carreras,
    @required this.indexPlantel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carreras.length,
      itemBuilder: (context, index) {
        final delay = index;
        final carrera = carreras[index];
        return LightBlueButton(
          carrera.nombre ?? 'Sin nombre',
          delay,
          (context) => _openAlumnosPage(context, index, carrera.nombre),
        );
      },
    );
  }

  void _openAlumnosPage(BuildContext context, int index, String nombre) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GruposPage(
            indexPlantel: indexPlantel,
            indexCarrera: index,
            title: nombre,
          ),
        ),
      );
}
