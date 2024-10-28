part of 'qrcode_bloc.dart';

sealed class QrcodeEvent extends Equatable {
  const QrcodeEvent();

  @override
  List<Object> get props => [];
}

final class CreateQrcodeEvent extends QrcodeEvent {
  const CreateQrcodeEvent({
    required this.nominal,
  });

  final double nominal;
}

final class ExpireQrcodeEvent extends QrcodeEvent {
  const ExpireQrcodeEvent();
}
