import 'package:emergenie/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:emergenie/screens/welcome_screen.dart';
import 'package:emergenie/screens/login_screen.dart';
import 'package:emergenie/screens/registration_screen.dart';
import 'package:emergenie/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

//void main() => runApp(Emergenie());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Emergenie());
}

class Emergenie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        Dashboard.id: (context) => Dashboard(),
      },
    );
  }
}
