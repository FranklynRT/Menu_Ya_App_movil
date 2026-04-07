class AuthService {
  static Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // simula API

    if (email == "test@test.com" && password == "1234") {
      return true;
    } else {
      return false;
    }
  }
}