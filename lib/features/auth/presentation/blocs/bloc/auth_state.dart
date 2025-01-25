part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Loading extends AuthState {}

final class Authenticated extends AuthState {}

final class UnAuthenticated extends AuthState {}

final class Registered extends AuthState {}

final class UnRegistered extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
