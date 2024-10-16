import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:realtime_websocket_flutter/core/common/app/providers/chart_provider.dart';
import 'package:realtime_websocket_flutter/core/extensions/context_extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/core_utils.dart';
import '../../domain/entities/chart.dart';
import '../bloc/charting_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/widgets/app_bar_core.dart';
import '../widgets/chart_widget.dart';

class ChartingScreen extends StatefulWidget {
  const ChartingScreen({super.key});

  @override
  State<ChartingScreen> createState() => ChartingScreenState();
}

class ChartingScreenState extends State<ChartingScreen> {
  late StreamController _streamController;

  final List<ChartSeriesController<Chart, DateTime>?> _chartSeriesControllers =
      [];

  @override
  void initState() {
    _initStream();
    // _streamController.close();
    context.read<ChartingBloc>().add(StreamChartValuesEvent(
          streamController: _streamController,
        ));
    super.initState();
  }

  _initStream() {
    _streamController = StreamController();
  }

  @override
  void dispose() {
    _streamController.close();
    _chartSeriesControllers.clear();
    context.chartProvider.clearCharts();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChartingBloc, ChartingState>(
      listener: (context, state) {
        if (state is ChartingError) {
          CoreUtils.showSnackBar(context, state.message);
        } else if (state is ChartingFetching) {
          CoreUtils.showSnackBar(context, 'Charting Fetched');
        } else if (state is FetchingStopped) {
          CoreUtils.showSnackBar(context, 'Fetching Stopped');
          context.chartProvider.clearCharts();
          _chartSeriesControllers.clear();

          print(_streamController.isClosed);
          _streamController.close();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarCore(
            title: 'Charting',
            size: 24,
            isBackButton: false,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Consumer<ChartProvider>(builder: (_, chartProvider, __) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    (state is FetchingStopped ||
                            state is ChartingError ||
                            state is! ChartingFetching)
                        ? const Center(
                            child: Text("StreamController is closed"))
                        : StreamBuilder(
                            stream: _streamController.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final length =
                                    chartProvider.addChart(snapshot.data);
                                if (length > 5) {
                                  // chartProvider.removeAt(0);
                                  for (int i = 0;
                                      i < chartProvider.charts.length;
                                      i++) {
                                    chartProvider.removeAt(
                                        chartProvider.tickerCodes[i], 0);
                                    _chartSeriesControllers[i]
                                        ?.updateDataSource(
                                      addedDataIndex: length - 1,
                                      removedDataIndex: 0,
                                    );
                                  }
                                }
                              }
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    for (int i = 0;
                                        i < chartProvider.charts.length;
                                        i++) ...[
                                      Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              chartProvider
                                                      .tickerCodes.isNotEmpty
                                                  ? chartProvider.tickerCodes[i]
                                                  : '',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              CoreUtils.toCurrencyFormat(
                                                chartProvider
                                                        .tickerCodes.isNotEmpty
                                                    ? (chartProvider
                                                            .charts[chartProvider
                                                                .tickerCodes[
                                                            i]] as List<Chart>)
                                                        .last
                                                        .lastPrice
                                                    : 0.0,
                                              ),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          // time
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              CoreUtils.timestampToTime(
                                                chartProvider
                                                        .tickerCodes.isNotEmpty
                                                    ? (chartProvider
                                                            .charts[chartProvider
                                                                .tickerCodes[
                                                            i]] as List<Chart>)
                                                        .last
                                                        .timestamp
                                                    : '0',
                                              ),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ChartWidget(
                                        chartData: chartProvider.charts[
                                                chartProvider.tickerCodes[i]] ??
                                            [],
                                        onRendererCreated: (controller) {
                                          _chartSeriesControllers
                                              .add(controller);
                                        },
                                      ),
                                    ]

                                    // Column(
                                    //   children: [
                                    //     Align(
                                    //       alignment: Alignment.topLeft,
                                    //       child: Text(
                                    //         chartProvider.charts.isNotEmpty
                                    //             ? chartProvider.charts.last.tickerCode
                                    //             : '',
                                    //         style: const TextStyle(
                                    //           fontSize: 16,
                                    //           fontWeight: FontWeight.bold,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.topLeft,
                                    //       child: Text(
                                    //         CoreUtils.toCurrencyFormat(
                                    //           chartProvider.charts.isNotEmpty
                                    //               ? chartProvider
                                    //                   .charts.last.lastPrice
                                    //               : 0.0,
                                    //         ),
                                    //         style: const TextStyle(
                                    //           fontSize: 16,
                                    //           fontWeight: FontWeight.bold,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // ChartWidget(
                                    //   chartData: chartProvider.charts,
                                    //   onRendererCreated: (controller) {
                                    //     _chartSeriesController = controller;
                                    //   },
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IgnorePointer(
                          ignoring: state is ChartingFetching ||
                              state is ChartingLoading,
                          child: InkWell(
                            onDoubleTap: () {},
                            child: ElevatedButton(
                              onPressed: () {
                                _initStream();
                                print("stream");
                                context
                                    .read<ChartingBloc>()
                                    .add(StreamChartValuesEvent(
                                      streamController: _streamController,
                                    ));
                              },
                              child: const Text('Start Stream'),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          ignoring: state is FetchingStopped ||
                              state is ChartingLoading,
                          child: InkWell(
                            onDoubleTap: () {},
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<ChartingBloc>()
                                    .add(const StopStreamChartValuesEvent());
                              },
                              child: const Text('Stop Stream'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
