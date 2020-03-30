import 'package:asistencias_v1/HttpServices.dart';
import 'package:asistencias_v1/pages/CarrerasPage.dart';
import 'package:asistencias_v1/providers/DatosGrupos.dart';

import 'package:asistencias_v1/widgets/custom_widgets.dart';

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
    final datosGrupos = Provider.of<DatosGrupos>(context);

    if (datosGrupos.isEmpty) {
      HttpServices.getGrupos(context);
      return Center(child: CircularProgressIndicator());
    }
    final planteles = datosGrupos.data.plantel;

    if (planteles.length == 0 || planteles.length == null)
      return Text('No hay grupos para mostrar');
    else if (planteles.length == 1)
      openCarreraPage(context, 0);
    else if (planteles.length > 1) {
      return ListView.builder(
        itemCount: planteles.length,
        itemBuilder: (context, index) {
          final delay = index * 350;
          final plantel = planteles[index];
          return _PlantelLightBlueButton(
            plantel.nombre,
            delay,
            index,
          );
        },
      );
    }
    return Container();
  }
}

void openCarreraPage(BuildContext context, int plantelIndex) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CarrerasPage(
        indexPlantel: plantelIndex,
      ),
    ),
  );
}

class _PlantelLightBlueButton extends LightBlueButton {
  final int delay;

  final String textButton;

  final int plantelIndex;

  _PlantelLightBlueButton(this.textButton, this.delay, this.plantelIndex)
      : super(textButton, delay);

  @override
  void onPresed(BuildContext context) {
    openCarreraPage(context, plantelIndex);
  }
}
