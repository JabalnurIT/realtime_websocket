part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initCharting();
}

Future<void> _initCharting() async {
  sl
    ..registerFactory(
      () => ChartingBloc(
        streamChartValues: sl(),
      ),
    )
    ..registerLazySingleton(() => StreamChartValues(sl()))
    ..registerLazySingleton<ChartingRepository>(
        () => ChartingRepositoryImpl(remoteDataSource: sl()))
    ..registerLazySingleton<ChartingRemoteDataSource>(
      () => const ChartingRemoteDataSourceImpl(),
    );
}
