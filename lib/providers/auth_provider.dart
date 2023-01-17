import 'package:shop_app/services/auth_service.dart';

class AuthProvider {
  AuthService authService = AuthService();

  int? currentUserId;

  Future<Map> getCurrentUser() async {
    return Future.value({});
  }

  Future<Map> login(String email, String password) async {
    var res = await authService.login(email, password);

    res.update('status', (value) => (value as int) == 1 ? true : false,
        ifAbsent: () => false);

    return res;
  }

  Future<Map> signUp() async {
    return Future.value({});
  }

  Future<Map> forgotPassword() async {
    return Future.value({});
  }
}
