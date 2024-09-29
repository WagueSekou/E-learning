import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  // Replace with your actual Laravel API URL
  final String _loginUrl = 'http://192.168.43.138:8000/api/login';
  //192.168.43.138

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      // Prepare the request body
      Map<String, String> body = {
        'email': email,
        'password': password,
      };

      // Send the POST request
      final response = await http.post(
        Uri.parse(_loginUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        // Return the parsed response data
        return responseData;
      } else {
        // If the server responds with a non-200 status code
        return {
          'success': false,
          'message': 'Login failed. Please check your credentials.',
        };
      }
    } catch (e) {
      // Catch any errors during the request and handle them
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }
}
