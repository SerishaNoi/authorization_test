import 'package:flutter/cupertino.dart';

class StyledCupertinoField extends StatelessWidget {
  final String placeholder;
  final Function(String) onChanged;
  final TextEditingController controller;

  const StyledCupertinoField({
    super.key,
    required this.placeholder,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      placeholder: placeholder,
      placeholderStyle: const TextStyle(
        fontSize: 22,
        color: CupertinoColors.placeholderText,
      ),
      decoration: const BoxDecoration(color: CupertinoColors.white),
    );
  }
}
