import 'package:flutter/material.dart';
import 'color_palette.dart';
import '../screens/profile.dart';
import '../screens/all_users.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showProfileIcon;
  final bool showAllUsersIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showProfileIcon = false,
    this.showAllUsersIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: ColorPalette.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: ColorPalette.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              if (showAllUsersIcon)
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AllUsersPage()),
                    );
                  },
                  icon: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.group, color: Colors.white),
                  ),
                ),
              if (showProfileIcon)
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                  icon: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
