import 'package:provider/provider.dart';
import 'package:realtime_websocket_flutter/core/common/app/providers/chart_provider.dart';

import 'package:flutter/material.dart';
import '../../../../core/common/widgets/app_bar_core.dart';
import '../widgets/table_widget.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => TableScreenState();
}

class TableScreenState extends State<TableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCore(
        title: 'Table',
        size: 24,
        isBackButton: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Consumer<ChartProvider>(builder: (_, chartProvider, __) {
            return TableWidget(
              tickerCodes: chartProvider.tickerCodes,
              mapCharts: chartProvider.charts,
            );
          }),
        ),
      ),
    );
  }
}
