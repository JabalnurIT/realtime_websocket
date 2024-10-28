import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendio_id/core/errors/failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });

    on<SignInWithCredentialEvent>(_signInWithCredentialHandler);

    on<SignInWithPhoneNumberEvent>(_signInWithPhoneNumberHandler);

    on<SendOtpEvent>(_sendOtpHandler);
  }

  Future<void> _signInWithCredentialHandler(
    SignInWithCredentialEvent event,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 3));

    const failure =
        ApiFailure(message: "Error, something went wrong", statusCode: 500);

    emit(AuthFailure(message: failure.message));

    await Future.delayed(const Duration(seconds: 3));
    emit(const AuthNotSignedIn());
  }

  Future<void> _signInWithPhoneNumberHandler(
    SignInWithPhoneNumberEvent event,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 3));

    // const failure =
    //     ApiFailure(message: "Error, something went wrong", statusCode: 500);

    // emit(AuthFailure(message: failure.message));

    emit(const AuthOtpRequested());
  }

  Future<void> _sendOtpHandler(
    SendOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 3));

    const failure = ApiFailure(message: "Berhasil", statusCode: 200);

    switch (failure.statusCode) {
      case 200:
        emit(const AuthOtpVerified());
        emit(const AuthSignedIn());
      case 404:
        emit(const AuthUserNotFound());
      case 400:
        emit(const AuthOtpFailed());
      default:
        emit(AuthFailure(message: failure.message));
    }
  }
}
