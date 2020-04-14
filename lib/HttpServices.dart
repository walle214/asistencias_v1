import 'package:asistencias_v1/providers/provider_collection.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

abstract class HttpServices {
  static final String _baseUrl =
      'https://sistemas.cruzperez.com/flutter-asistencias/';

  static void getGrupos(BuildContext context) async {
    DatosFederacion datosFederacion = Provider.of<DatosFederacion>(context);
    DatosGrupos datosGrupos = Provider.of<DatosGrupos>(context);

    if (!datosGrupos.isEmpty) return datosGrupos.notify();
    if (datosFederacion.isEmpty) return;
    var uId = datosFederacion.waifu.uTrabajador[0] == ''
        ? datosFederacion.waifu.uCuenta
        : datosFederacion.waifu.uTrabajador;
    String url = _baseUrl + 'grupos/${uId[0]}/';

    Response response = await http.get(url);
    datosGrupos.initGruposData(response.body);
  }

  static void getAlumnosList(BuildContext context, String grupoKey) async {
    DatosGrupos providerDatosGrupos = Provider.of<DatosGrupos>(context);
    DatosAlumnos providerDatosAlumnos = Provider.of<DatosAlumnos>(context);
    DatosClases providerDatosClases = Provider.of<DatosClases>(context);
    String token = providerDatosGrupos.data.token;
    String endpoint = providerDatosGrupos.data.endpoint;

    String url = '$_baseUrl/alumnos/$token/$endpoint/$grupoKey/';

    Response res = await http.get(url);

    final alumnosList = providerDatosAlumnos.addAlumnosData(res.body, grupoKey);

    providerDatosClases.addAlumnos(alumnosList, grupoKey);
  }
}
