import 'package:flutter/material.dart';

/// @description: 按钮
class ButtonWidget extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;
  const ButtonWidget(
      {super.key, required this.title, this.enable = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      height: 45,
      onPressed: enable ? onPressed : null,
      disabledColor: Colors.white60,
      color: Colors.blueGrey,
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      )
    );
  }
}
