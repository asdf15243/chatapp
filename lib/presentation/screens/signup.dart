import 'package:flutter/material.dart';
import 'package:chatapp/presentation/widgets/color_palette.dart';
import 'package:chatapp/presentation/widgets/text_field.dart';
import 'package:chatapp/presentation/widgets/elevated_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),

              // Heading
              Text(
                'Sign Up',
                style: TextStyle(
                  color: ColorPalette.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              // Profile picture placeholder
              GestureDetector(
                onTap: () {
                  // Profile picture selection logic to be implemented later
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: ColorPalette.inputFill,
                  child: Icon(
                    Icons.add_a_photo,
                    color: ColorPalette.textSecondary,
                    size: 32,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Username field
              CustomTextField(hintText: 'Username'),
              const SizedBox(height: 20),

              // DOB field
              CustomTextField(hintText: 'Date of Birth'),
              const SizedBox(height: 20),

              // Gender field
              CustomTextField(hintText: 'Gender'),
              const SizedBox(height: 30),

              // Sign Up button
              CustomElevatedButton(
                text: 'Sign Up',
                onPressed: () {
                  // Handle sign-up action here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
