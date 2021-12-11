abstract class LoginRepository {
  Future<bool> login({required String email, required String password});
  Future<bool> createAccount(
      {required String name, required String email, required String password});
}
