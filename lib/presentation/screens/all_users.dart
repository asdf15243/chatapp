import 'package:flutter/material.dart';
import '../widgets/color_palette.dart';
import '../widgets/app_bar.dart';

class AllUsersPage extends StatelessWidget {
  const AllUsersPage({super.key});

  // Dummy user data for now
  final List<Map<String, String>> users = const [
    {
      'name': 'Alice',
      'image': 'https://i.pravatar.cc/150?img=1',
    },
    {
      'name': 'Bob',
      'image': 'https://i.pravatar.cc/150?img=2',
    },
    {
      'name': 'Charlie',
      'image': 'https://i.pravatar.cc/150?img=3',
    },
    {
      'name': 'David',
      'image': 'https://i.pravatar.cc/150?img=4',
    },
    {
      'name': 'Eve With A Very Long Username That Exceeds One Line',
      'image': 'https://i.pravatar.cc/150?img=5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      appBar: const AppBarWidget(title: 'All Users'),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        itemCount: users.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final user = users[index];
          return InkWell(
            onTap: () {
              // Placeholder for future navigation logic
              print('Tapped on ${user['name']}');
            },
            borderRadius: BorderRadius.circular(8), // optional: ripple effect with rounded corners
            child: Container(
              height: 70, // fixed height for the profile area
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorPalette.dialogBackground, // optional: subtle background
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user['image']!),
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      user['name']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
