import 'package:asistencias_v1/HttpServices.dart';
import 'package:asistencias_v1/providers/DatosGrupos.dart';

import 'package:asistencias_v1/widgets/custom_widgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrerasPage extends StatelessWidget {
  final int indexPlantel;
  const CarrerasPage({Key key, this.indexPlantel = 0}) : super(key: key);
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
    final carreras =
        Provider.of<DatosGrupos>(context).data.plantel[indexPlantel].carreras;
    // if(carreras.length  0)
    return carreras != null
        ? ListView.builder(
            itemCount: carreras.length,
            itemBuilder: (context, index) {
              final delay = index * 350;
              final carrera = carreras[index];
              return CarreraLightBlueButton(
                carrera.nombre ?? 'Hola',
                delay,
              );
            },
          )
        : Container();
  }
}

class CarreraLightBlueButton extends LightBlueButton {
  final int delay;

  final String textButton;

  CarreraLightBlueButton(this.textButton, this.delay)
      : super(textButton, delay);

  @override
  void onPresed(BuildContext context) {
    // print(context.widget);
  }
}
