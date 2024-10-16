import 'package:flutter/material.dart';

import '../../../../src/charting/domain/entities/chart.dart';
import '../../../utils/core_utils.dart';

class ChartProvider extends ChangeNotifier {
  final List<String> _tickerCodes = [];

  List<String> get tickerCodes => _tickerCodes;

  int addTickerCode(String tickerCode) {
    if (_tickerCodes.contains(tickerCode)) {
      return _tickerCodes.length;
    }
    _tickerCodes.add(tickerCode);
    Future.delayed(Duration.zero, (() => notifyListeners()));
    return _tickerCodes.length;
  }

  void removeTickerCode(String tickerCode) {
    _tickerCodes.remove(tickerCode);
    notifyListeners();
  }

  void clearTickerCodes() {
    _tickerCodes.clear();
    notifyListeners();
  }

  final Map<String, List<Chart>> _charts = {};

  Map<String, List<Chart>> get charts => _charts;

  int addChart(Chart chart) {
    if (_charts.containsKey(chart.tickerCode)) {
      if (_charts[chart.tickerCode]!.any((element) =>
          CoreUtils.timestampToSecond(element.timestamp) ==
          CoreUtils.timestampToSecond(chart.timestamp))) {
        return _charts[chart.tickerCode]!.length;
      }
      _charts[chart.tickerCode]!.add(chart);
      return _charts[chart.tickerCode]!.length;
    }
    _charts[chart.tickerCode] = [chart];
    addTickerCode(chart.tickerCode);
    Future.delayed(Duration.zero, (() => notifyListeners()));
    return _charts[chart.tickerCode]!.length;
  }

  void removeAt(String tickerCode, int index) {
    _charts[tickerCode]!.removeAt(index);
    Future.delayed(Duration.zero, (() => notifyListeners()));
  }

  void removeChart(String tickerCode, Chart chart) {
    _charts[tickerCode]!.remove(chart);
    notifyListeners();
  }

  void clearCharts() {
    _charts.clear();
    clearTickerCodes();
    notifyListeners();
  }

  // List<Chart> get charts => _charts;

  // int addChart(Chart chart) {
  //   // if _charts contains chart that has the same timestamp as chart.timestamp
  //   if (_charts.any((element) =>
  //       CoreUtils.timestampToSecond(element.timestamp) ==
  //       CoreUtils.timestampToSecond(chart.timestamp))) {
  //     return _charts.length;
  //   }
  //   _charts.add(chart);
  //   return _charts.length;
  //   // notifyListeners();
  // }

  // void removeAt(int index) {
  //   _charts.removeAt(index);
  // }

  // void removeChart(Chart chart) {
  //   _charts.remove(chart);
  //   notifyListeners();
  // }

  // void clearCharts() {
  //   _charts.clear();
  //   notifyListeners();
  // }
}
