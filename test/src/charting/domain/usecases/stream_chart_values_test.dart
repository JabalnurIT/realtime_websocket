import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vendio_id/src/charting/domain/repositories/charting_repository.dart';
import 'package:vendio_id/src/charting/domain/usecases/stream_chart_values.dart';

import 'charting_repository.mock.dart';

void main() {
  late ChartingRepository repository;
  late StreamChartValues usecase;
  late StreamController<String> streamController;

  setUp(() {
    repository = MockChartingRepo();
    usecase = StreamChartValues(repository);
    streamController = StreamController<String>();
  });

  test(
    'should call the [ChartingRepo.streamChartValues] method',
    () async {
      when(
        () => repository.streamChartValues(
          streamController: streamController,
        ),
      ).thenAnswer(
        (_) async => const Right(null),
      );
      // This is for testing Future

      final result = await usecase(streamController);

      expect(
        result,
        const Right(null),
      );

      verify(
        () => repository.streamChartValues(
          streamController: streamController,
        ),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
