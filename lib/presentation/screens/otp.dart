import 'package:flutter/material.dart';
import 'package:chatapp/presentation/widgets/color_palette.dart';
import 'package:chatapp/presentation/widgets/otp_text_field.dart';
import 'package:chatapp/presentation/widgets/elevated_button.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

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
              const SizedBox(height: 50),

              // Heading
              Text(
                'Enter OTP',
                style: TextStyle(
                  color: ColorPalette.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // Instruction text
              Text(
                'We have sent an OTP to your mobile number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPalette.textSecondary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),

              // OTP Text Field
              OTPTextField(
                onCompleted: (otp) {
                  print('Entered OTP: $otp');
                  // You can navigate to next page or verify OTP here
                },
              ),
              const SizedBox(height: 40),

              // Submit button
              CustomElevatedButton(
                text: 'Verify OTP',
                onPressed: () {
                  // Handle OTP verification
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
