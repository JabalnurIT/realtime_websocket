import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realtime_websocket_flutter/src/charting/domain/usecases/stream_chart_values.dart';

part 'charting_event.dart';
part 'charting_state.dart';

class ChartingBloc extends Bloc<ChartingEvent, ChartingState> {
  ChartingBloc({
    required StreamChartValues streamChartValues,
  })  : _streamChartValues = streamChartValues,
        super(const ChartingInitial()) {
    on<ChartingEvent>((event, emit) {
      emit(const ChartingLoading());
    });
    on<StopStreamChartValuesEvent>((event, emit) {
      emit(const FetchingStopped());
    });
    on<StreamChartValuesEvent>(_streamChartValuesHandler);
  }
  final StreamChartValues _streamChartValues;

  Future<void> _streamChartValuesHandler(
    StreamChartValuesEvent event,
    Emitter<ChartingState> emit,
  ) async {
    emit(const ChartingLoading());
    final result = await _streamChartValues(event.streamController);

    result.fold(
      (failure) => emit(ChartingError(message: failure.message)),
      (_) => emit(const ChartingFetching()),
    );
  }
}
