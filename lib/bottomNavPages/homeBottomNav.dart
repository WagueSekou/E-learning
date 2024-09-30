import 'package:elearning/Pages/Courses.dart';
import 'package:elearning/Pages/homePage.dart';
import 'package:elearning/Pages/messages.dart';
import 'package:elearning/Pages/user_account.dart';
import 'package:flutter/material.dart';

class Homebottomnav extends StatefulWidget {
  const Homebottomnav({super.key});

  @override
  State<Homebottomnav> createState() => _HomebottomnavState();
}

class _HomebottomnavState extends State<Homebottomnav> {
  int _selectedIndex = 0;

//Function to update the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//Pages of the bottomNavBar items
  List<Widget> _pages = [
    Homepage(),
    CourseScreen('Flutter'),
    MessageScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //displaying the selected page from bottomNavBar
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          iconSize: 32,
          selectedItemColor: Colors.purple[200],
          selectedFontSize: 18,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: 'Courses'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ]),
    );
  }
}
