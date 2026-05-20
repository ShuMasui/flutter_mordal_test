// Flutter imports:
import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  Btn({
    super.key,
    required this.text,
    required this.onPressed,
    this.isCancel = false,
    this.height = 50,
    this.width = 150,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isCancel;
  final double height;
  final double width;

  final BoxDecoration _cancelDecoration = BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  final BoxDecoration _defaultDecoration = BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isCancel ? _cancelDecoration : _defaultDecoration,
      height: height.toDouble(),
      width: width.toDouble(),
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
