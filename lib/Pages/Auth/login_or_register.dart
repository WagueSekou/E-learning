import 'package:elearning/Pages/Auth/Login/login.dart';
import 'package:elearning/Pages/Auth/Registeration/registrer.dart';
import 'package:flutter/material.dart';

class PageToggeler extends StatefulWidget {
  const PageToggeler({super.key});

  @override
  State<PageToggeler> createState() => _PageToggelerState();
}

class _PageToggelerState extends State<PageToggeler> {
  //initiallising show login page
  bool showLoginPage = true;

  //toggling method
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage();
    } else {
      return RegistrationPage();
    }
  }
}
