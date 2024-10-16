part of 'charting_bloc.dart';

sealed class ChartingEvent extends Equatable {
  const ChartingEvent();

  @override
  List<Object> get props => [];
}

class StreamChartValuesEvent extends ChartingEvent {
  const StreamChartValuesEvent({
    required this.streamController,
  });

  final StreamController streamController;

  @override
  List<Object> get props => [streamController];
}

class StopStreamChartValuesEvent extends ChartingEvent {
  const StopStreamChartValuesEvent();
}
