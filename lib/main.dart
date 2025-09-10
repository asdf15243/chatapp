import 'package:flutter/material.dart';
import '../presentation/screens/login.dart';
import '../presentation/widgets/app_theme.dart'; // import your AppTheme

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: AppTheme.darkTheme, // use your custom theme here
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
