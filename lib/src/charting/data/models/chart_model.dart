import '../../../../core/utils/typedef.dart';
import '../../domain/entities/chart.dart';

class ChartModel extends Chart {
  const ChartModel({
    required super.id,
    required super.tickerCode,
    required super.lastPrice,
    required super.quantityTrade,
    required super.dailyChangePercent,
    required super.dailyDiffPrice,
    required super.timestamp,
  });

  const ChartModel.empty()
      : this(
          id: '1722383678363',
          tickerCode: 'BTC-USD',
          lastPrice: 66249.0,
          quantityTrade: 0.085,
          dailyChangePercent: -0.72,
          dailyDiffPrice: -480.0,
          timestamp: '1722383678363',
        );

  ChartModel copyWith({
    String? id,
    String? tickerCode,
    double? lastPrice,
    double? quantityTrade,
    double? dailyChangePercent,
    double? dailyDiffPrice,
    String? timestamp,
  }) {
    return ChartModel(
      id: id ?? this.id,
      tickerCode: tickerCode ?? this.tickerCode,
      lastPrice: lastPrice ?? this.lastPrice,
      quantityTrade: quantityTrade ?? this.quantityTrade,
      dailyChangePercent: dailyChangePercent ?? this.dailyChangePercent,
      dailyDiffPrice: dailyDiffPrice ?? this.dailyDiffPrice,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  ChartModel.fromMap(DataMap map)
      : super(
          id: map['t'].toString(),
          tickerCode: map['s'] as String,
          lastPrice: double.parse(map['p']),
          quantityTrade: double.parse(map['q']),
          dailyChangePercent: double.parse(map['dc']),
          dailyDiffPrice: double.parse(map['dd']),
          timestamp: map['t'].toString(),
        );

  DataMap toMap() {
    return {
      's': tickerCode,
      'p': lastPrice.toString(),
      'q': quantityTrade.toString(),
      'dc': dailyChangePercent.toString(),
      'dd': dailyDiffPrice.toString(),
      't': int.parse(timestamp),
    };
  }

  ChartModel.fromEntity(Chart entity)
      : super(
          id: entity.id,
          tickerCode: entity.tickerCode,
          lastPrice: entity.lastPrice,
          quantityTrade: entity.quantityTrade,
          dailyChangePercent: entity.dailyChangePercent,
          dailyDiffPrice: entity.dailyDiffPrice,
          timestamp: entity.timestamp,
        );
}

extension TimestampExtension on ChartModel {
  ChartModel toSeconds() {
    return copyWith(
      id: (int.parse(id) ~/ 1000).toString(),
      timestamp: (int.parse(timestamp) ~/ 1000).toString(),
    );
  }

  ChartModel toMinutes() {
    return copyWith(
      id: (int.parse(id) ~/ 60000).toString(),
      timestamp: (int.parse(timestamp) ~/ 60000).toString(),
    );
  }

  ChartModel toHours() {
    return copyWith(
      id: (int.parse(id) ~/ 3600000).toString(),
      timestamp: (int.parse(timestamp) ~/ 3600000).toString(),
    );
  }

  ChartModel toDays() {
    return copyWith(
      id: (int.parse(id) ~/ 86400000).toString(),
      timestamp: (int.parse(timestamp) ~/ 86400000).toString(),
    );
  }

  ChartModel toWeeks() {
    return copyWith(
      id: (int.parse(id) ~/ (86400000 * 7)).toString(),
      timestamp: (int.parse(timestamp) ~/ (86400000 * 7)).toString(),
    );
  }

  ChartModel toMonths() {
    return copyWith(
      id: (int.parse(id) ~/ (86400000 * 30)).toString(),
      timestamp: (int.parse(timestamp) ~/ (86400000 * 30)).toString(),
    );
  }

  ChartModel toThreeMonths() {
    return copyWith(
      id: (int.parse(id) ~/ (86400000 * 90)).toString(),
      timestamp: (int.parse(timestamp) ~/ (86400000 * 90)).toString(),
    );
  }

  ChartModel toSixMonths() {
    return copyWith(
      id: (int.parse(id) ~/ (86400000 * 180)).toString(),
      timestamp: (int.parse(timestamp) ~/ (86400000 * 180)).toString(),
    );
  }

  ChartModel toYears() {
    return copyWith(
      id: (int.parse(id) ~/ (86400000 * 365)).toString(),
      timestamp: (int.parse(timestamp) ~/ (86400000 * 365)).toString(),
    );
  }
}
