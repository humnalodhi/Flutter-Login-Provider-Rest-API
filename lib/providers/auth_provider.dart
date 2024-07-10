import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;

  bool get getLoading => loading;

  TextEditingController emailController = TextEditingController();

  TextEditingController get getEmailController => emailController;
  TextEditingController passwordController = TextEditingController();

  TextEditingController get getPasswordController => passwordController;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        print('Successful');
        setLoading(false);
      } else {
        print('Failed');
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
