import 'package:flutter/material.dart';
import 'package:realtime_websocket_flutter/core/utils/core_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/res/colours.dart';
import '../../domain/entities/chart.dart';
import 'package:intl/intl.dart' as intl;

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.chartData,
    required this.onRendererCreated,
  });

  final List<Chart> chartData;

  final Function(ChartSeriesController<Chart, DateTime>)? onRendererCreated;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SfCartesianChart(
          series: <LineSeries<Chart, DateTime>>[
            LineSeries<Chart, DateTime>(
              onRendererCreated: onRendererCreated,
              dataSource: chartData,
              color: Colours.primaryColour,
              xValueMapper: (Chart chart, _) =>
                  CoreUtils.timestampToDateTime(chart.timestamp),
              yValueMapper: (Chart chart, _) => chart.lastPrice,
              animationDelay: 0,
              animationDuration: 0,
            )
          ],
          primaryXAxis: DateTimeAxis(
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
            labelIntersectAction: AxisLabelIntersectAction.rotate90,
            labelRotation: -45,
            intervalType: DateTimeIntervalType.seconds,
            dateFormat: intl.DateFormat.Hms(),
            maximumLabelWidth: 50,
            labelStyle: const TextStyle(
              fontSize: 10,
            ),
          ),
          primaryYAxis: const NumericAxis(
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
            title: AxisTitle(text: 'Price'),
          ),
        ),
      ),
    );
  }
}
