import 'package:LoginSample/services/auth.dart';
import 'package:flutter/widgets.dart';

class SignInViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passController = TextEditingController();

  bool isError = false;
  bool isLoading = false;
  String error = '';

  void initialise() {
    userNameController.text = '';
    passController.text = '';
    notifyListeners();
  }

  onClickSignIn() async {
    if (formKey.currentState.validate()) {
      isLoading = true;
      isError = false;
      notifyListeners();

      dynamic result = await authService.signInWithEmailAndPassword(
          userNameController.text.trim(), passController.text.trim());
      if (result == null) {
        error = 'Invalid username or password';
        isLoading = false;
        isError = true;
        notifyListeners();
      }
    }
  }
}
