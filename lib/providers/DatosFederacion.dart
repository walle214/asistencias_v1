import 'package:asistencias_v1/models/federacion.dart';
import 'package:flutter/material.dart';

class DatosFederacion with ChangeNotifier {
  WaifuData waifu;

  DatosFederacion() {
    waifu = null;
  }

  void initWaifuData(String data) {
    waifu = WaifuData.fromRawJson(data);
    notifyListeners();
  }

  // void notify() => notifyListeners();

  bool get isEmpty => waifu == null;

  void clear() {
    waifu = null;
    notifyListeners();
  }
}
