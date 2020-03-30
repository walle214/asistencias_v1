import 'package:asistencias_v1/pages/LoginPage.dart';
import 'package:asistencias_v1/pages/PlantelesPage.dart';
import 'package:asistencias_v1/providers/DatosFederacion.dart';
import 'package:asistencias_v1/providers/DatosGrupos.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:asistencias_v1/pages/FederationLoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DatosFederacion()),
        ChangeNotifierProvider(create: (context) => DatosGrupos()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          'federationLogin': (context) => FederationLoginPage(),
          'plantel': (context) => PlantelesPage(),
        },
      ),
    );
  }
}
