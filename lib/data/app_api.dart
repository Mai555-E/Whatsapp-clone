import 'package:supabase_flutter/supabase_flutter.dart';

class AppServiceClient {
  static final _supabase = Supabase.instance.client;

  static Future<bool> login(EmailPasswordLogin login) async {
    final response = await _supabase.auth.signInWithPassword(email: login.email, password: login.password!);

    return (response.user != null) ? true : false;
  }

  static Future<void> register(EmailPasswordRegister register) async {
    final response = await _supabase.auth.signUp(email: register.email, password: register.password);

    if (response.user != null) {
      register.id = response.user!.id;

      await _createNewUser(register);
    }
  }

  static PostgrestFilterBuilder<dynamic> _createNewUser(EmailPasswordRegister register) {
    return _supabase.from('users').insert({
      'picture': null,
      'id': register.id,
      'name': register.name,
      'phone': register.phone,
      'last_seen': DateTime.now().toIso8601String(),
      'status': 'Hey there! I\'m using this chat app.',
    });
  }
}

class EmailPasswordLogin {
  String? email, password;

  EmailPasswordLogin({this.email, this.password});
}

class EmailPasswordRegister {
  String? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  EmailPasswordRegister({required this.email, required this.password, required this.phone, required this.name});
}
