part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignInRequested extends AuthEvent {
  final String email;
  final String password;
  final String phoneNumber;

  SignInRequested({
    required this.email,
    required this.password,
    required this.phoneNumber,
  });
}

final class SignUpRequested extends AuthEvent {
  final String email;
  final String phoneNumber;
  final String password;

  SignUpRequested({
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}
