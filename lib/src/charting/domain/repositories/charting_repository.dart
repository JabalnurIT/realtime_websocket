import 'dart:async';

import '../../../../core/utils/typedef.dart';

abstract class ChartingRepository {
  const ChartingRepository();

  ResultVoid streamChartValues({
    required StreamController<dynamic> streamController,
  });
}
