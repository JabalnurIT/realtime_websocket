import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:realtime_websocket_flutter/core/utils/core_utils.dart';
import 'package:realtime_websocket_flutter/src/charting/domain/entities/chart.dart';

/// Example without a datasource
class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.tickerCodes,
    required this.mapCharts,
  });

  final List<String> tickerCodes;
  final Map<String, List<Chart>> mapCharts;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 0,
      minWidth: MediaQuery.of(context).size.width - 12,
      columns: const [
        DataColumn2(
          label: Text(
            'Symbol',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text(
            'Last',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          size: ColumnSize.M,
        ),
        DataColumn2(
          label: Text(
            'Chg',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          size: ColumnSize.M,
        ),
        DataColumn2(
          label: Text(
            'Chg %',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          size: ColumnSize.M,
        ),
      ],
      rows: List<DataRow>.generate(
        tickerCodes.length,
        (index) => DataRow(
          cells: [
            DataCell(
              Text(
                tickerCodes[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataCell(
              Text(
                CoreUtils.toCurrencyFormat(
                    mapCharts[tickerCodes[index]]?.last.lastPrice ?? 0.0),
              ),
            ),
            DataCell(
              Text(
                (mapCharts[tickerCodes[index]]?.last.dailyDiffPrice ?? 0.0)
                    .toStringAsFixed(2),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: (mapCharts[tickerCodes[index]]?.last.dailyDiffPrice ??
                              0.0) >
                          0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
            DataCell(
              Text(
                "${(mapCharts[tickerCodes[index]]?.last.dailyChangePercent ?? 0.0).toStringAsFixed(2)}%",
                style: TextStyle(
                  color: (mapCharts[tickerCodes[index]]?.last.dailyDiffPrice ??
                              0.0) >
                          0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
