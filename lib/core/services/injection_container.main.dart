part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  final dio = Dio();
  final api = API();

  await _initCore(
    prefs: prefs,
    dio: dio,
    api: api,
  );
}

Future<void> _initCore({
  required SharedPreferences prefs,
  required Dio dio,
  required API api,
}) async {
  sl
    ..registerLazySingleton(() => dio)
    ..registerLazySingleton(() => api)
    ..registerLazySingleton(() => prefs);
}
