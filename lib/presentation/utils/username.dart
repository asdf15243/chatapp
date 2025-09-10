import 'package:flutter/material.dart';
import '../widgets/color_palette.dart';
import '../widgets/text_field.dart';

class UsernameWidget extends StatefulWidget {
  final String initialUsername;
  final void Function(String) onChanged;

  const UsernameWidget({
    super.key,
    this.initialUsername = '',
    required this.onChanged,
  });

  @override
  State<UsernameWidget> createState() => _UsernameWidgetState();
}

class _UsernameWidgetState extends State<UsernameWidget> {
  late TextEditingController controller;
  bool isValid = true;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialUsername);
    isValid = isValidUsername(widget.initialUsername);
  }

  bool isValidUsername(String username) {
    if (username.isEmpty) return true; // empty field is allowed
    final regex = RegExp(r'^[a-z0-9_]{1,20}$'); // only lowercase, digits, underscore
    return regex.hasMatch(username);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          maxLength: 20,
          decoration: CustomTextField.getDecoration('Username')
              .copyWith(counterText: ''), // remove default counter
          style: TextStyle(color: ColorPalette.textPrimary),
          cursorColor: ColorPalette.textPrimary,
          onChanged: (val) {
            // automatically convert to lowercase
            final lowercaseVal = val.toLowerCase();
            if (val != lowercaseVal) {
              controller.value = controller.value.copyWith(
                text: lowercaseVal,
                selection: TextSelection.collapsed(offset: lowercaseVal.length),
              );
            }

            final valid = isValidUsername(lowercaseVal);
            if (valid != isValid) {
              setState(() {
                isValid = valid;
              });
            }
            widget.onChanged(lowercaseVal);
          },
        ),
        const SizedBox(height: 4),
        Text(
          'Use only lowercase letters (a-z), numbers (0-9), and underscores (_) without spaces.',
          style: TextStyle(
            color: (controller.text.isEmpty || isValid) ? Colors.white54 : Colors.red,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
