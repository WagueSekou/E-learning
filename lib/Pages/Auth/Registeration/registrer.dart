import 'dart:convert';

import 'package:elearning/Pages/Auth/Login/login.dart';
import 'package:elearning/Pages/Auth/Registeration/controller/registrationController.dart';
import 'package:elearning/Pages/reuseable/appBtn.dart';
import 'package:elearning/Pages/reuseable/appTextfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  //final Function()? onTap;
  const RegistrationPage({super.key, /*required this.onTap*/});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController(text: 'nickk');
  final TextEditingController _emailController = TextEditingController(text: 'nickk@gmail.com');
  final TextEditingController _userNameController = TextEditingController(text: 'nickk');
  final TextEditingController _passwordController = TextEditingController(text: '123456789');
  final TextEditingController _confirmPasswordController = TextEditingController(text: '123456789');

  //
 /* late RegistrationController registrationController;
  @override
  void initState() {
    super.initState();
    registrationController = RegistrationController(
      emailController: _emailController,
      userNameController: _userNameController,
      passwordController: _passwordController,
      confirmPasswordController: _confirmPasswordController,
    );
  }*/

  Future<void> _register() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8001/api/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': _nameController.text,
        'username':_userNameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 201){
      final responseData = jsonDecode(response.body);
      print('User registered successfully: ${responseData['users']}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginPage(),));
    }else{
      print('Failed to register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //icon
              Icon(
                Icons.person,
                size: 100,
              ),

              SizedBox(
                height: 20,
              ),

              //text message
              Text(
                "let's create you an account",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //username textfield
              AppTextfield(
                  controller: _userNameController,
                  hintText: "Username",
                  obscureText: false),

              SizedBox(
                height: 20,
              ),

              //login text field
              AppTextfield(
                  controller: _emailController,
                  hintText: "email",
                  obscureText: false),

              SizedBox(
                height: 20,
              ),

              //password textfield
              AppTextfield(
                  controller: _passwordController,
                  hintText: "password",
                  obscureText: true),
              SizedBox(
                height: 20,
              ),

              //confirmpassword textfield
              AppTextfield(
                  controller: _confirmPasswordController,
                  hintText: "confirm password",
                  obscureText: false),

              SizedBox(
                height: 20,
              ),

              //don't have an account text
              Row(
                children: [
                  Text(
                    "Already a member?",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      //onTap: widget.onTap,
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //button login
              AppButton(
                  onTap: () {
                    _register();
                  },
                  text: 'Register'),
              ElevatedButton(onPressed: (){_register();},
                  child: Text('click')),

              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
