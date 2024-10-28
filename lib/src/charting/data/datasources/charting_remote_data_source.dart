import 'dart:async';
import 'dart:convert';
import 'package:vendio_id/core/utils/typedef.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constanst.dart';
import '../models/chart_model.dart';

abstract class ChartingRemoteDataSource {
  const ChartingRemoteDataSource();

  Future<void> streamChartValues({
    required StreamController<dynamic> streamController,
  });
}

class ChartingRemoteDataSourceImpl implements ChartingRemoteDataSource {
  const ChartingRemoteDataSourceImpl();

  @override
  Future<void> streamChartValues({
    required StreamController<dynamic> streamController,
  }) async {
    try {
      final wsUrl = Uri.parse(kWsHost);
      final channel = WebSocketChannel.connect(wsUrl);

      await channel.ready;

      channel.sink.add(
          jsonEncode({"action": "subscribe", "symbols": "ETH-USD,BTC-USD"}));

      channel.stream.listen((event) async {
        if (streamController.isClosed) {
          await channel.sink.close(status.goingAway);
        } else {
          if (event.contains('"s"')) {
            final data = ChartModel.fromMap(jsonDecode(event) as DataMap);
            streamController.add(data);
          }
        }
      }, onError: (e) async {
        await channel.sink.close(status.goingAway);
        await streamController.close();
      });
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
}
