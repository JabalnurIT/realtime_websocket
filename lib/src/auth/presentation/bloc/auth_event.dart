part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithPhoneNumberEvent extends AuthEvent {
  const SignInWithPhoneNumberEvent({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class SignInWithCredentialEvent extends AuthEvent {
  const SignInWithCredentialEvent();
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}

class SendOtpEvent extends AuthEvent {
  const SendOtpEvent({required this.verificationId});

  final String verificationId;

  @override
  List<Object> get props => [verificationId];
}
