import 'package:equatable/equatable.dart';

class Chart extends Equatable {
  const Chart({
    required this.id,
    required this.tickerCode,
    required this.lastPrice,
    required this.quantityTrade,
    required this.dailyChangePercent,
    required this.dailyDiffPrice,
    required this.timestamp,
  });

  const Chart.empty()
      : id = '1722383678363',
        tickerCode = 'BTC-USD',
        lastPrice = 66249.0,
        quantityTrade = 0.085,
        dailyChangePercent = -0.72,
        dailyDiffPrice = -480.0,
        timestamp = '1722383678363';

  final String id;
  final String tickerCode;
  final double lastPrice;
  final double quantityTrade;
  final double dailyChangePercent;
  final double dailyDiffPrice;
  final String timestamp;

  @override
  List<Object?> get props => [
        id,
        tickerCode,
      ];

  @override
  String toString() {
    return 'Chart{id: $id, tickerCode: $tickerCode, lastPrice: $lastPrice, '
        'quantityTrade: $quantityTrade, dailyChangePercent: $dailyChangePercent, '
        'dailyDiffPrice: $dailyDiffPrice, timestamp: $timestamp}';
  }
}
