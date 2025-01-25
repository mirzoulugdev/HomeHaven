import 'package:bloc/bloc.dart';
import '../../../data/repositories/auth_repository_impl.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl repo;
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<SignInRequested>(
      (event, emit) async {
        emit(Loading());
        try {
          final result = await repo.signIn(
            phoneNumber: event.phoneNumber,
            password: event.password,
            email: event.email,
          );
          if (result != null) {
            emit(Authenticated());
          } else {
            emit(UnAuthenticated());
          }
        } catch (e) {
          emit(AuthError(message: e.toString()));
          emit(UnAuthenticated());
        }
      },
    );
    on<SignUpRequested>(
      (event, emit) async {
        emit(Loading());
        try {
          final result = await repo.signUp(
            phoneNumber: event.phoneNumber,
            password: event.password,
            email: event.email,
          );
          if (result != null) {
            emit(Registered());
          } else {
            emit(UnRegistered());
          }
        } catch (e) {
          emit(AuthError(message: e.toString()));
          emit(UnRegistered());
        }
      },
    );
  }
}
