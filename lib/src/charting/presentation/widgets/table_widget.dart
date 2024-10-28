import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:vendio_id/core/utils/core_utils.dart';
import 'package:vendio_id/src/charting/domain/entities/chart.dart';

/// Example without a datasource
class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.tickerCodes,
    required this.tablesValue,
  });

  final List<String> tickerCodes;
  final Map<String, Chart> tablesValue;

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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataCell(
              Text(
                CoreUtils.toCurrencyFormat(
                    tablesValue[tickerCodes[index]]?.lastPrice ?? 0.0),
              ),
            ),
            DataCell(
              Text(
                (tablesValue[tickerCodes[index]]?.dailyDiffPrice ?? 0.0)
                    .toStringAsFixed(2),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color:
                      (tablesValue[tickerCodes[index]]?.dailyDiffPrice ?? 0.0) >
                              0
                          ? Colors.green
                          : Colors.red,
                ),
              ),
            ),
            DataCell(
              Text(
                "${(tablesValue[tickerCodes[index]]?.dailyChangePercent ?? 0.0).toStringAsFixed(2)}%",
                style: TextStyle(
                  color:
                      (tablesValue[tickerCodes[index]]?.dailyDiffPrice ?? 0.0) >
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
