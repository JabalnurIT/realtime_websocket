import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:vendio_id/core/utils/typedef.dart';
import 'package:vendio_id/src/charting/data/models/chart_model.dart';
import 'package:vendio_id/src/charting/domain/entities/chart.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tChartModel = ChartModel.empty();

  test('should be a subclass of [Chart] entity',
      () => expect(tChartModel, isA<Chart>()));

  final tMap = jsonDecode(fixture('chart.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [ChartModel] from the Map', () {
      final result = ChartModel.fromMap(tMap);

      expect(result, equals(tChartModel));
    });

    test('should throw an Error when the map is invalid ', () {
      final map = DataMap.from(tMap)..remove('s');

      const call = ChartModel.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });
  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      final result = tChartModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [DataModel] with updated value', () {
      final result = tChartModel.copyWith(
        tickerCode: 'IDR',
      );

      expect(
        result.tickerCode,
        equals('IDR'),
      );
    });
  });
}
