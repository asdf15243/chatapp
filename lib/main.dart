import 'package:flutter/material.dart';
import 'package:chatapp/presentation/screens/login.dart';
import 'package:chatapp/presentation/screens/profile.dart';
import 'package:chatapp/presentation/widgets/app_theme.dart'; // import your AppTheme

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Starting page
      routes: {
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),
        // you can add more routes here in the future
      },
    );
  }
}
