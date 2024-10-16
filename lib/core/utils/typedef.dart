import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef ResultStream<T> = Stream<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
