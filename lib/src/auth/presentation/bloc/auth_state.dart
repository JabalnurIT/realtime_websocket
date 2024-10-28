part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthFailure extends AuthState {
  const AuthFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class AuthOtpRequested extends AuthState {
  const AuthOtpRequested();
}

final class AuthOtpSent extends AuthState {
  const AuthOtpSent();
}

final class AuthOtpFailed extends AuthState {
  const AuthOtpFailed();
}

final class AuthOtpVerified extends AuthState {
  const AuthOtpVerified();
}

final class AuthSignedOut extends AuthState {
  const AuthSignedOut();
}

final class AuthNotSignedIn extends AuthState {
  const AuthNotSignedIn();
}

final class AuthSignedIn extends AuthState {
  const AuthSignedIn();
}

final class AuthUserNotFound extends AuthState {
  const AuthUserNotFound();
}
