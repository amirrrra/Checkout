1import 'package:checkout/core/styles.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.text,  this.isLoading = false,
  });

  final void Function()? onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 73)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          backgroundColor: MaterialStateProperty.all(const Color(0xFF34A853))),
      child: Center(
          child: isLoading ? const CircularProgressIndicator() : Text(
        text,
        style: Styles.style22,
        textAlign: TextAlign.center,
      )),
    );
  }
}
