import 'package:supabase/supabase.dart';
import 'package:ta_caro/shared/models/user_model.dart';
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
  Future<UserModel> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    final response = await client.auth.signUp(email, password);
    if (response.error == null) {
      final user = UserModel.fromMap(response.user!.toJson());
      return user;
    } else {
      throw Exception(
          response.error!.message ?? "Não foi possivel criar conta!");
    }
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);
    if (response.error == null) {
      final user = UserModel.fromMap(response.user!.toJson());
      return user;
    } else {
      throw Exception(
          response.error!.message ?? "Não foi possivel fazer login!");
    }
  }
}
