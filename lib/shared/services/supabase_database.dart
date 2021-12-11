import 'package:supabase/supabase.dart';
import 'package:ta_caro/shared/services/app_database.dart';

class SupabaseDatabase implements AppDatabase {
  late final SupabaseClient client;

  SupabaseDatabase() {
    init();
  }

  @override
  void init() {
    client = SupabaseClient(const String.fromEnvironment("URL"),
        const String.fromEnvironment("KEY"));
  }

  @override
  Future<bool> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    final response = await client.auth.signUp(email, password);
    return response.error == null;
  }

  @override
  Future<bool> login({required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);
    return response.error == null;
  }
}
