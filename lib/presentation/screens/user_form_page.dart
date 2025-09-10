import 'package:flutter/material.dart';
import 'package:chatapp/presentation/utils/username.dart'; // UsernameWidget
import 'package:chatapp/presentation/utils/dob.dart';      // DOBWidget
import 'package:chatapp/presentation/utils/gender.dart';   // GenderWidget
import '../widgets/color_palette.dart';

class UserFormPage extends StatefulWidget {
  final Map<String, String>? initialData;

  const UserFormPage({super.key, this.initialData});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  String username = '';
  String dob = '';
  String gender = '';

  @override
  void initState() {
    super.initState();
    username = widget.initialData?['username'] ?? '';
    dob = widget.initialData?['dob'] ?? '';
    gender = widget.initialData?['gender'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile picture
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white24,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
        ),
        const SizedBox(height: 30),

        // Username field
        UsernameWidget(
          initialUsername: username,
          onChanged: (val) {
            setState(() {
              username = val;
            });
          },
        ),
        const SizedBox(height: 20),

        // DOB field with calendar icon (already inside DOBWidget)
        DOBWidget(
          initialDOB: dob,
          onChanged: (val) {
            setState(() {
              dob = val;
            });
          },
        ),
        const SizedBox(height: 20),

        // Gender field with dropdown arrow (already inside GenderWidget)
        GenderWidget(
          initialGender: gender,
          onChanged: (val) {
            setState(() {
              gender = val;
            });
          },
        ),
      ],
    );
  }
}
