// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/services/login_services/auth_services.dart';


class AuthProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  User? _user;
  String? _error;
  bool _isLoading = false;

  User? get user => _user;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<User> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await AuthService.login(email, password);
      _user = User.fromJson(response['user']);
    } catch (e) {
      _error = e.toString().replaceAll("Exception: ", "");
    }

    _isLoading = false;
    notifyListeners();
    return _user!;
  }

  @override
  void dispose() {
    // Manage the disposal of controllers to prevent memory leaks
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  
}
