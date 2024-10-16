part of 'charting_bloc.dart';

sealed class ChartingState extends Equatable {
  const ChartingState();

  @override
  List<Object> get props => [];
}

final class ChartingInitial extends ChartingState {
  const ChartingInitial();
}

final class ChartingLoading extends ChartingState {
  const ChartingLoading();
}

final class ChartingError extends ChartingState {
  const ChartingError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class ChartingIdle extends ChartingState {
  const ChartingIdle();
}

final class ChartingFetching extends ChartingState {
  const ChartingFetching();
}

final class FetchingStopped extends ChartingState {
  const FetchingStopped();
}
