import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:chatapp/presentation/widgets/color_palette.dart';
import 'package:chatapp/presentation/widgets/text_field.dart';
import 'package:chatapp/presentation/widgets/elevated_button.dart'; // import custom button
import 'package:chatapp/presentation/screens/signup.dart';
import 'package:chatapp/presentation/screens/otp.dart';
import 'package:chatapp/presentation/screens/chat_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // App title
              Text(
                'Chat App',
                style: TextStyle(
                  color: ColorPalette.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // Phone number input
              IntlPhoneField(
                initialCountryCode: 'IN',
                style: TextStyle(color: ColorPalette.textPrimary),
                dropdownTextStyle: TextStyle(color: ColorPalette.textPrimary),
                decoration: CustomTextField.getDecoration('Enter mobile number'),
                cursorColor: ColorPalette.textPrimary,
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),

              const SizedBox(height: 30),

              // Send OTP button
              CustomElevatedButton(
                text: 'Send OTP',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatPage(), // navigate to OTP page
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
