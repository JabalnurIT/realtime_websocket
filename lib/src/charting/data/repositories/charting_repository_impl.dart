import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:vendio_id/core/utils/typedef.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/charting_repository.dart';
import '../datasources/charting_remote_data_source.dart';

class ChartingRepositoryImpl implements ChartingRepository {
  const ChartingRepositoryImpl({
    required ChartingRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final ChartingRemoteDataSource _remoteDataSource;

  @override
  ResultVoid streamChartValues({
    required StreamController<dynamic> streamController,
  }) async {
    try {
      await _remoteDataSource.streamChartValues(
        streamController: streamController,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
