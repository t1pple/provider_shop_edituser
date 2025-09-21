import 'package:flutter/foundation.dart';

class UserProfileProvider with ChangeNotifier {
  String _username = "Poiter24"; // ค่าเริ่มต้น

  String get username => _username;

  void setUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }
}
