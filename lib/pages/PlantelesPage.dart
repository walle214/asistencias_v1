import 'package:animate_do/animate_do.dart';
import 'package:asistencias_v1/HttpServices.dart';

import 'package:asistencias_v1/pages/CarrerasPage.dart';

import 'package:asistencias_v1/providers/DatosGrupos.dart';

import 'package:asistencias_v1/widgets/AppBarUDC.dart';
import 'package:asistencias_v1/widgets/ButtonsWidgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantelesPage extends StatelessWidget {
  const PlantelesPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUDC(),
      body: Center(child: body(context)),
    );
  }

  Widget body(BuildContext context) {
    final datosGrupos = Provider.of<DatosGrupos>(context);

    if (datosGrupos.isEmpty) {
      HttpServices.getGrupos(context);
      return CircularProgressIndicator();
    }
    final planteles = datosGrupos.data.plantel;

    if (planteles.length == 0)
      return Text('No hay grupos para mostrar');
    else if (planteles.length == 1)
      CarrerasPage(indexPlantel: 0);
    else if (planteles.length > 1) {
      final planteles = Provider.of<DatosGrupos>(context).data.plantel;
      return ListView.builder(
        itemCount: planteles.length,
        itemBuilder: (context, index) {
          final delay = index * 350;
          final plantel = planteles[index];
          return PlantelLightBlueButton(
              textButton: plantel.nombre, delay: delay, plantelIndex: index);
        },
      );
    }
    return Container();
  }
}

class PlantelLightBlueButton extends LightBlueButton {
  final int delay;

  final String textButton;

  final int plantelIndex;

  PlantelLightBlueButton(
      {@required this.textButton,
      @required this.delay,
      @required this.plantelIndex})
      : super(textButton: textButton, delay: delay);

  @override
  void onPresed(BuildContext context) {
    // print(context.widget);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarrerasPage(
          indexPlantel: plantelIndex,
        ),
      ),
    );
  }
}
