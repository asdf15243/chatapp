// lib/services/auth_service.dart

import 'package:flutter/material.dart';

class AuthService {
  // Logout method: navigates to login page
  static Future<void> logout(BuildContext context) async {
    // Future Firebase logout logic will go here
    Navigator.pushReplacementNamed(context, '/login');
  }

  // Delete account method: navigates to login page after account is deleted
  static Future<void> deleteAccount(BuildContext context) async {
    // Future Firebase delete account logic will go here
    Navigator.pushReplacementNamed(context, '/login');
  }
}
