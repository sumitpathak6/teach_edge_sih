import 'package:flutter/material.dart';
import 'package:teach_edge/auth/login_or_register.dart';
import 'package:teach_edge/screens/home_screen.dart';
import 'package:teach_edge/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/auth': (context) => const LoginOrRegister(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
