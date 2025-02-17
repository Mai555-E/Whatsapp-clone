import '../../../data/app_api.dart';
import '../base/controller.dart';

class LoginController extends AuthController {
  LoginController() : super(["Email", "Password"]);

  @override
  Future<bool> authenticate() async {
    if (formKey.currentState!.validate()) {
      String email = getFieldValue("Email");
      String password = getFieldValue("Password");

      return await AppServiceClient.login(EmailPasswordLogin(email: email, password: password));
    }

    return false;
  }
}
