import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/pages/login_page.dart';
import 'package:to_do/controllers/user_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Duration of the animation
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward(); // Start the animation
    navigateUser();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> navigateUser() async {
    await Firebase.initializeApp();
    await Future.delayed(const Duration(seconds: 2)); // Change the duration as needed
    if (UserController.user != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'img',
                child: Image.asset(
                  'assets/img.png', // Change 'img.png' to your image path
                  height: 150, // Adjust height as needed
                ),
              ),
              SizedBox(height: 20), // Add some space between image and text
              Text(
                'Task Tracker',
                style: TextStyle(
                  fontSize: 24, // Adjust font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


