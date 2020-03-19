import 'package:asistencias_v1/pages/PlantelesPage.dart';
import 'package:asistencias_v1/providers/DatosFederacion.dart';
import 'package:asistencias_v1/providers/DatosGrupos.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:asistencias_v1/pages/FederationPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          '/': (context) {
            final waifu = Provider.of<DatosFederacion>(context);

            return waifu.isEmpty
                ? FederationPage(
                    onMessageReceived: (JavascriptMessage message) {
                      //if(message.message.startsWith("Login"))
                      // print(Provider.of<DatosFederacion>(context).isEmpty);
                      waifu.initWaifuData(message.message);
                      // print(waifu.waifu);
                      // print(message.message);
                      // print(message.message);

                      Navigator.pushNamedAndRemoveUntil(
                          context, 'plantel', (_) => false);
                    },
                    initialUrl:
                        'https://sistemas.cruzperez.com/flutter-asistencias/login.php',
                  )
                : PlantelesPage();
          },
          'plantel': (context) => PlantelesPage(),
        },
      ),
    );
  }
}
