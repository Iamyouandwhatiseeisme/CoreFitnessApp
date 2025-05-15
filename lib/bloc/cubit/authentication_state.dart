part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationSigningIn extends AuthenticationState {}

final class AuthenticationSignedIn extends AuthenticationState {}

final class AuthenticationSignInError extends AuthenticationState {
  final String message;

  AuthenticationSignInError(this.message);
}

final class AuthenticationSignedOut extends AuthenticationState {}
