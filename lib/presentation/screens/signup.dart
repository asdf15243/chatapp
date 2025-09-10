import 'package:flutter/material.dart';
import 'user_form_page.dart';
import '../widgets/color_palette.dart';
import '../widgets/elevated_button.dart';
import 'package:chatapp/presentation/screens/chat_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sign Up text at the top
              const Text(
                'Sign Up.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Form fields
              const UserFormPage(),

              const SizedBox(height: 20),

              // Center the Sign Up button horizontally
              Center(
                child: CustomElevatedButton(
                  text: 'Sign Up',
                  onPressed: () {
                    // Navigate to ChatPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
