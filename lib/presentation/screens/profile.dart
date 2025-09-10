import 'package:flutter/material.dart';
import 'user_form_page.dart';
import 'package:chatapp/services/auth_service.dart';
import '../widgets/color_palette.dart';
import '../widgets/app_bar.dart';
import '../widgets/elevated_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _handleLogout(BuildContext context) {
    AuthService.logout(context);
  }

  void _handleDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
            'Are you sure you want to permanently delete your account instantly?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              AuthService.deleteAccount(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      // AppBar just by passing the title
      appBar: const AppBarWidget(title: 'Profile Page'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Scrollable form area
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const UserFormPage(),
                      const SizedBox(height: 20),
                      CustomElevatedButton(
                        text: 'Save',
                        onPressed: () {
                          print("Save profile info");
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom-right text-only clickable buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => _handleLogout(context),
                        child: const Text(
                          'Log Out',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => _handleDeleteAccount(context),
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60), // optional spacing from bottom
            ],
          ),
        ),
      ),
    );
  }
}
