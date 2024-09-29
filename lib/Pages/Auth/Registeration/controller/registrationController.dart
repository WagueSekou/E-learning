import 'package:elearning/Services/registration_service.dart';
import 'package:flutter/material.dart';

class RegistrationController {
  final TextEditingController emailController;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  RegistrationController({
    required this.emailController,
    required this.userNameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  // Validate input fields
  bool validateInput() {
    if (emailController.text.isEmpty ||
        userNameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      // Show error for empty fields
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      // Show error if passwords don't match
      return false;
    }

    return true;
  }

  // Call the RegistrationService to register the user
  Future<void> registerUser(BuildContext context) async {
    if (!validateInput()) {
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("Please fill in all fields and ensure passwords match.")),
      );
      return;
    }

    try {
      // Call the service to register the user
      final response = await RegistrationService().register(
        userNameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (response['success']) {
        // Registration successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
        // Redirect to login or home page
      } else {
        // Show error message from the server
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      }
    } catch (e) {
      // Handle error and display message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }
}
