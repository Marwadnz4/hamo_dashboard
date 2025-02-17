import 'package:flutter/material.dart';

class ClearIconButton extends StatelessWidget {
  const ClearIconButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.close,
        color: Colors.grey,
      ),
    );
  }
}
