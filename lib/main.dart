import 'package:asistencias_v1/providers/provider_collection.dart';
import 'package:asistencias_v1/widgets/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:provider/provider.dart';

import 'package:asistencias_v1/pages/pages_collection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(CustomColors.darkBlue);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DatosFederacion()),
        ChangeNotifierProvider(create: (context) => DatosGrupos()),
        ChangeNotifierProvider(create: (context) => DatosAlumnos()),
        ChangeNotifierProvider(create: (context) => DatosClases()),
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
