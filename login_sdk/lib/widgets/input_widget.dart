import 'package:flutter/material.dart';

/// @description: 输入框
/// @return {*}
class InputWidget extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;

  const InputWidget(
      {super.key,
      required this.hint,
      this.onChanged,
      this.obscureText = false,
      this.keyboardType});

  get _input {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autofocus: !obscureText,
      cursorColor: Colors.white,
      style: const TextStyle(
          fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _input,
        const Divider(
          color: Colors.white,
          height: 1,
          thickness: 0.5,
        )
      ],
    );
  }
}
