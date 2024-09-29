import 'package:elearning/Pages/Auth/Registeration/controller/registrationController.dart';
import 'package:elearning/Pages/reuseable/appBtn.dart';
import 'package:elearning/Pages/reuseable/appTextfield.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  final Function()? onTap;
  const RegistrationPage({super.key, required this.onTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailTextController = TextEditingController();
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTexteController = TextEditingController();

  //
  late RegistrationController registrationController;
  @override
  void initState() {
    super.initState();
    registrationController = RegistrationController(
      emailController: emailTextController,
      userNameController: userNameTextController,
      passwordController: passwordTextController,
      confirmPasswordController: confirmPasswordTexteController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                controller: userNameTextController,
                hintText: "Username",
                obscureText: false),

            SizedBox(
              height: 20,
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
            SizedBox(
              height: 20,
            ),

            //confirmpassword textfield
            AppTextfield(
                controller: confirmPasswordTexteController,
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
                    onTap: widget.onTap,
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
                  registrationController.registerUser(context);
                },
                text: 'Login'),

            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
