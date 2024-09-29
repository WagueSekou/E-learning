import 'package:elearning/Services/login_service.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class LoginController {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginController({
    required this.emailController,
    required this.passwordController,
  });

  Future<void> login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Check if fields are empty
    if (email.isEmpty) {
      Fluttertoast.showToast(msg: "Email field is empty");
      return;
    }
    if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Password field is empty");
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Call the login service
      LoginService loginService = LoginService();
      var result = await loginService.login(email, password);

      // Close the loading indicator
      Navigator.of(context).pop();

      // Check if the login was successful
      if (result != null && result['success'] == true) {
        // Navigate to the home page
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Display error message
        Fluttertoast.showToast(
            msg: result != null ? result['message'] : "Login failed");
      }
    } catch (e) {
      // Close the loading indicator and show error
      Navigator.of(context).pop();
      Fluttertoast.showToast(msg: "An error occurred: $e");
    }
  }
}
