part of 'qrcode_bloc.dart';

sealed class QrcodeState extends Equatable {
  const QrcodeState();

  @override
  List<Object> get props => [];
}

final class QrcodeInitial extends QrcodeState {
  const QrcodeInitial();
}

final class QrcodeLoading extends QrcodeState {
  const QrcodeLoading();
}

final class QrcodeError extends QrcodeState {
  const QrcodeError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class QrcodeCreated extends QrcodeState {
  const QrcodeCreated();
}

final class QrcodeExpired extends QrcodeState {
  const QrcodeExpired({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
