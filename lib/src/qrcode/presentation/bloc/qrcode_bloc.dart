import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'qrcode_event.dart';
part 'qrcode_state.dart';

class QrcodeBloc extends Bloc<QrcodeEvent, QrcodeState> {
  QrcodeBloc() : super(const QrcodeInitial()) {
    on<QrcodeEvent>((event, emit) {
      emit(const QrcodeLoading());
    });

    on<CreateQrcodeEvent>(_createQrcodeHandler);

    on<ExpireQrcodeEvent>(_expireQrcodeHandler);
  }

  Future<void> _createQrcodeHandler(
    CreateQrcodeEvent event,
    Emitter<QrcodeState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(const QrcodeCreated());
    await Future.delayed(const Duration(seconds: 3));
    emit(const QrcodeExpired(
      message: 'Qrcode expired',
    ));
  }

  Future<void> _expireQrcodeHandler(
    ExpireQrcodeEvent event,
    Emitter<QrcodeState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(const QrcodeExpired(
      message: 'Qrcode expired',
    ));
  }
}
