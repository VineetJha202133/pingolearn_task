import 'package:flutter/material.dart';

class KeyboardClose extends StatelessWidget {
  final Widget child;
  const KeyboardClose({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
