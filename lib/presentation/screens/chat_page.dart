import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/chat_tab_selector.dart';
import '../widgets/chat_row.dart';
import '../widgets/color_palette.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String selectedTab = 'All'; // default tab

  void toggleTab(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            CustomAppBar(
              title: 'Chats are secure',
              showProfileIcon: true,
            ),

            const SizedBox(height: 16),

            // Tabs
            ChatTabSelector(
              selectedTab: selectedTab,
              onTabSelected: toggleTab,
            ),

            const SizedBox(height: 16),

            // Chat list placeholder
            Expanded(
              child: ListView.builder(
                itemCount: 0, // empty for now
                itemBuilder: (context, index) {
                  return const ChatRow(); // will populate later with dynamic data
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
