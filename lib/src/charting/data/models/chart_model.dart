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
