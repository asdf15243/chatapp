import 'package:flutter/material.dart';
import '../widgets/color_palette.dart';
import '../widgets/text_field.dart';

class GenderWidget extends StatefulWidget {
  final String initialGender;
  final void Function(String) onChanged;

  const GenderWidget({
    super.key,
    this.initialGender = '',
    required this.onChanged,
  });

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  late TextEditingController controller;
  final List<String> options = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialGender);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _showGenderDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorPalette.dialogBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options.map((gender) {
              final bool isSelected = controller.text == gender;
              return ListTile(
                title: Text(
                  gender,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.white,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  setState(() {
                    controller.text = gender;
                  });
                  widget.onChanged(gender);
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showGenderDialog,
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: CustomTextField.getDecoration('Gender'),
          style: TextStyle(color: ColorPalette.textPrimary),
          cursorColor: ColorPalette.textPrimary,
        ),
      ),
    );
  }
}
