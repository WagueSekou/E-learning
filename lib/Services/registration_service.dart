import 'dart:convert';
import 'package:http/http.dart' as http;

class RegistrationService {
  final String _registerUrl = 'https://your-laravel-api.com/api/register';

  // Register user
  Future<Map<String, dynamic>> register(
      String username, String email, String password) async {
    try {
      // Prepare the request body
      Map<String, String> body = {
        'username': username,
        'email': email,
        'password': password,
      };

      // Send the POST request to the backend API
      final response = await http.post(
        Uri.parse(_registerUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        // Handle error if registration fails
        return {
          'success': false,
          'message': 'Registration failed. Please try again later.'
        };
      }
    } catch (e) {
      // Handle any errors that occur during the request
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }
}
