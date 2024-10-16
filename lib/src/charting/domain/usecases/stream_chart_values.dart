import 'dart:async';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/charting_repository.dart';

class StreamChartValues
    implements UsecaseWithParams<void, StreamController<dynamic>> {
  const StreamChartValues(this._repository);

  final ChartingRepository _repository;

  @override
  ResultVoid call(StreamController<dynamic> streamController) =>
      _repository.streamChartValues(
        streamController: streamController,
      );
}
