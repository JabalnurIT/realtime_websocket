import 'package:get_it/get_it.dart';
import 'package:vendio_id/src/charting/domain/usecases/stream_chart_values.dart';

import '../../src/auth/presentation/bloc/auth_bloc.dart';
import '../../src/charting/data/datasources/charting_remote_data_source.dart';
import '../../src/charting/data/repositories/charting_repository_impl.dart';
import '../../src/charting/domain/repositories/charting_repository.dart';
import '../../src/charting/presentation/bloc/charting_bloc.dart';
import '../../src/qrcode/presentation/bloc/qrcode_bloc.dart';
import '../../src/settlement/presentation/bloc/settlement_bloc.dart';
import '../../src/transaction/presentation/bloc/transaction_bloc.dart';

part 'injection_container.main.dart';
