import 'package:whatsapp_clone_app/data/app_api.dart';

import '../base/controller.dart';

class RegisterController extends AuthController {
  RegisterController() : super(["Username", "Email", "Phone", "Password"]);

  @override
  Future<bool> authenticate() async {
    if (formKey.currentState!.validate()) {
      String username = getFieldValue("Username");
      String email = getFieldValue("Email");
      String phone = getFieldValue("Phone");
      String password = getFieldValue("Password");

      return await AppServiceClient.register(EmailPasswordRegister(email: email, password: password, phone: phone, username: username));
    }

    return false;
  }
}
