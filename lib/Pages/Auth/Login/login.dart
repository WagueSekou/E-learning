import 'package:elearning/Pages/Auth/Login/controller/loginController.dart';
import 'package:elearning/Pages/reuseable/appBtn.dart';
import 'package:elearning/Pages/reuseable/appTextfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  //
  late LoginController loginController;
  @override
  void initState() {
    super.initState();
    //initialize the logincontroller with textEditingControllers
    loginController = LoginController(
        emailController: emailTextController,
        passwordController: passwordTextController);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

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
                  controller: emailTextController,
                  hintText: "email",
                  obscureText: false),

              SizedBox(
                height: 20,
              ),

              //password textfield
              AppTextfield(
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
              AppButton(
                  onTap: () {
                    loginController.login(context);
                    // print("Login button tapped!");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Homepage(),
                    //     ));
                  },
                  text: 'Login'),

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
