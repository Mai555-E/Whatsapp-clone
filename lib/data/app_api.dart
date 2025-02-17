import 'package:supabase_flutter/supabase_flutter.dart';

class AppServiceClient {
  static final _supabase = Supabase.instance.client;

  static Future<bool> login(EmailPasswordLogin login) async {
    final response = await _supabase.auth.signInWithPassword(email: login.email, password: login.password);

    return (response.user != null) ? true : false;
  }

  static Future<bool> register(EmailPasswordRegister register) async {
    final response = await _supabase.auth.signUp(email: register.email, password: register.password);

    if (response.user != null) {
      register.id = response.user!.id;

      await _createNewUser(register);

      return true;
    }

    return false;
  }

  static PostgrestFilterBuilder<dynamic> _createNewUser(EmailPasswordRegister register) {
    return _supabase.from('users').insert({
      'picture': null,
      'id': register.id,
      'phone': register.phone,
      'name': register.username,
      'last_seen': DateTime.now().toIso8601String(),
      'status': 'Hey there! I\'m using this chat app.',
    });
  }
}

class EmailPasswordLogin {
  final String email, password;

  const EmailPasswordLogin({required this.email, required this.password});
}

class EmailPasswordRegister {
  String? id;
  final String email;
  final String phone;
  final String username;
  final String password;

  EmailPasswordRegister({required this.email, required this.password, required this.phone, required this.username});
}
