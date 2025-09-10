import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntlPhoneField(
      initialCountryCode: 'IN', // default India code
      // No decoration, style, or callbacks here
    );
  }
}
