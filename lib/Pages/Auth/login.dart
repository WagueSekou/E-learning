import 'package:elearning/Pages/Auth/reuseable/appBtn.dart';
import 'package:elearning/Pages/Auth/reuseable/appTextfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
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
                  width: 350,
                  controller: emailTextController,
                  hintText: "email",
                  obscureText: false),

              SizedBox(
                height: 20,
              ),

              //password textfield
              AppTextfield(
                  width: 350,
                  controller: passwordTextController,
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
                      onTap: widget.onTap,
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
              AppButton(onTap: () {}, text: 'Login'),

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
