import 'package:LoginSample/services/auth.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {
  Stream dataStream;
  final AuthService authService = AuthService();

  getDataStream(String userId) {
    dataStream = authService.getGrade(userId);
    return dataStream;
  }
}
