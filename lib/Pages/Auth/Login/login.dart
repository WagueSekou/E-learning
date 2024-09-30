import 'dart:convert';

import 'package:elearning/Pages/Auth/Login/controller/loginController.dart';
import 'package:elearning/Pages/Auth/Registeration/registrer.dart';
import 'package:elearning/Pages/homePage.dart';
import 'package:elearning/Pages/reuseable/appBtn.dart';
import 'package:elearning/Pages/reuseable/appTextfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  //final Function()? onTap;
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(text: 'nick@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '1234');
  bool _isLoading = false;

  //
  //late LoginController loginController;

  /*void initState() {
    super.initState();
    //initialize the logincontroller with textEdi.tingControllers
    loginController = LoginController(
        emailController: emailTextController,
        passwordController: passwordTextController);
  }*/

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    var response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty){
      setState(() {
        _isLoading = false;
      });
      print('empty fields');
      return;
    }
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('user login success');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
    }else{
      print('login failed: ${response.body}');
    }

    setState(() {
      _isLoading = false;
    });
  }
  /*@override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //thirth partie auth icon
              Container(
                margin:
                    EdgeInsets.only(left: 80, right: 80, top: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Image.asset("assets/images/facebook.png")),
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(child: Image.asset("assets/images/google.png")),
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(child: Image.asset("assets/images/facebook.png")),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Icon(
                Icons.lock,
                size: 100,
              ),

              //text message
              Text(
                "Or use your email to login",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(
                height: 45,
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

              //don't have an account text
              Row(
                children: [
                  Text(
                    "Not yet member?",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> RegistrationPage()));},
                      child: Text(
                    "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 60,
              ),

              //button login
              AppButton(
                  onTap: () {_login();
                    /*loginController.login(context);*/
                    // print("Login button tapped!");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Homepage(),
                    //     ));
                  },
                  text: 'Login'),
              ElevatedButton(onPressed:(){ _login(); },
                child: _isLoading? CircularProgressIndicator(): Text('click me')),

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
