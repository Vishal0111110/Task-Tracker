import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/pages/login_page.dart';
import 'package:to_do/screens/home.dart';
import 'package:to_do/splash_screen.dart';

import 'controllers/user_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: UserController.user != null ?  Home() : const SplashScreen(),
    );
  }
}