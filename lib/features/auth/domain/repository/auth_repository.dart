abstract class AuthRepository {
  Future<void> signUp({
    required String phoneNumber,
    required String password,
    required String email,
  });
  Future<void> signIn({
    required String phoneNumber,
    required String password,
    required String email,
  });
}
