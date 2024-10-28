part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initAuth();
  await _initCharting();
  await _initQrcode();
  await _initTransaction();
  await _initSettlement();
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

Future<void> _initAuth() async {
  sl.registerFactory(
    () => AuthBloc(),
  );
}

Future<void> _initQrcode() async {
  sl.registerFactory(
    () => QrcodeBloc(),
  );
}

Future<void> _initTransaction() async {
  sl.registerFactory(
    () => TransactionBloc(),
  );
}

Future<void> _initSettlement() async {
  sl.registerFactory(
    () => SettlementBloc(),
  );
}
