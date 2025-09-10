import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/color_palette.dart';
import '../widgets/text_field.dart';

class DOBWidget extends StatefulWidget {
  final String initialDOB;
  final void Function(String) onChanged;

  const DOBWidget({
    super.key,
    this.initialDOB = '',
    required this.onChanged,
  });

  @override
  State<DOBWidget> createState() => _DOBWidgetState();
}

class _DOBWidgetState extends State<DOBWidget> {
  late TextEditingController controller;
  int selectedDay = 1, selectedMonth = 1, selectedYear = DateTime.now().year;

  final List<int> days = List.generate(31, (i) => i + 1);
  final List<String> months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  late final List<int> years;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialDOB);
    int currentYear = DateTime.now().year;
    years = List.generate(151, (i) => currentYear - i);

    if (widget.initialDOB.isNotEmpty) {
      try {
        var parts = widget.initialDOB.split('/');
        selectedDay = int.tryParse(parts[0]) ?? 1;
        selectedMonth = int.tryParse(parts[1]) ?? 1;
        selectedYear = int.tryParse(parts[2]) ?? currentYear;
      } catch (_) {}
    }
  }

  void _updateController() {
    controller.text =
    '${selectedDay.toString().padLeft(2, '0')}/${selectedMonth.toString().padLeft(2, '0')}/$selectedYear';
    widget.onChanged(controller.text);
  }

  void _validateFutureDate() {
    final now = DateTime.now();
    if (DateTime(selectedYear, selectedMonth, selectedDay).isAfter(now)) {
      selectedDay = now.day;
      selectedMonth = now.month;
      selectedYear = now.year;
    }
  }

  Widget _buildPicker<T>(List<T> items, int selectedIndex, ValueChanged<int> onChanged) {
    return Expanded(
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: selectedIndex),
        backgroundColor: Colors.black,
        itemExtent: 32,
        onSelectedItemChanged: onChanged,
        children: items.map((e) => Center(child: Text('$e', style: const TextStyle(color: Colors.white)))).toList(),
      ),
    );
  }

  void _showDOBPicker() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent, // so the container color shows
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: ColorPalette.dialogBackground, // full grey box
              borderRadius: BorderRadius.circular(16), // rounded corners
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 300,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Day picker
                      Expanded(
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(initialItem: selectedDay - 1),
                          backgroundColor: ColorPalette.dialogBackground,
                          itemExtent: 32,
                          onSelectedItemChanged: (i) {
                            selectedDay = days[i];
                            _validateFutureDate();
                            _updateController();
                          },
                          children: days
                              .map((d) => Center(
                            child: Text(
                              d.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                              .toList(),
                        ),
                      ),
                      // Month picker
                      Expanded(
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(initialItem: selectedMonth - 1),
                          backgroundColor: ColorPalette.dialogBackground,
                          itemExtent: 32,
                          onSelectedItemChanged: (i) {
                            selectedMonth = i + 1;
                            _validateFutureDate();
                            _updateController();
                          },
                          children: months
                              .map((m) => Center(
                            child: Text(
                              m,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                              .toList(),
                        ),
                      ),
                      // Year picker
                      Expanded(
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(initialItem: years.indexOf(selectedYear)),
                          backgroundColor: ColorPalette.dialogBackground,
                          itemExtent: 32,
                          onSelectedItemChanged: (i) {
                            selectedYear = years[i];
                            _validateFutureDate();
                            _updateController();
                          },
                          children: years
                              .map((y) => Center(
                            child: Text(
                              y.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextButton(
                    onPressed: () {
                      _updateController();
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Save My Birth Date",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDOBPicker,
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: CustomTextField.getDecoration('Date of Birth'),
          style: TextStyle(color: ColorPalette.textPrimary),
          cursorColor: ColorPalette.textPrimary,
        ),
      ),
    );
  }
}
