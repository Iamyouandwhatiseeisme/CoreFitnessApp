part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SigningUp extends SignUpState {}

final class SignedUp extends SignUpState {}

final class SignUpError extends SignUpState {
  final String message;

  SignUpError(this.message);
}
