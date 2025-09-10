import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_palette.dart';

class OTPTextField extends StatefulWidget {
  final int length;
  final void Function(String)? onCompleted;

  const OTPTextField({super.key, this.length = 6, this.onCompleted});

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField>
    with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      if (_controller.text.length == widget.length && widget.onCompleted != null) {
        widget.onCompleted!(_controller.text);
      }
      setState(() {}); // update boxes
    });

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  Widget _buildOtpBoxes() {
    List<Widget> boxes = [];
    int nextIndex = _controller.text.length;

    for (int i = 0; i < widget.length; i++) {
      String digit = i < _controller.text.length ? _controller.text[i] : '';
      bool showCursor = i == nextIndex && _controller.text.length < widget.length;

      boxes.add(Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 45,
            height: 55,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: digit.isEmpty
                    ? ColorPalette.inputBorder
                    : ColorPalette.buttonBackground,
                width: 2,
              ),
              color: ColorPalette.inputFill,
            ),
            child: Text(
              digit,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorPalette.textPrimary,
              ),
            ),
          ),
          if (showCursor)
            FadeTransition(
              opacity: _blinkController,
              child: Container(
                width: 2,
                height: 20,
                color: ColorPalette.textPrimary,
              ),
            ),
        ],
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: boxes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildOtpBoxes(),
        // Hidden TextField to handle input
        Opacity(
          opacity: 0.0,
          child: TextField(
            controller: _controller,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: widget.length,
            showCursor: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
