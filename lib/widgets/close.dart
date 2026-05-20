// Flutter imports:
import 'package:flutter/material.dart';

class Close extends StatelessWidget {
  const Close({super.key, required this.onPressed, this.size = 50});

  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: IconButton(icon: const Icon(Icons.close), onPressed: onPressed),
    );
  }
}
