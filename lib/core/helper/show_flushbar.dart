import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showFlushBar({
  required BuildContext context,
  required String message,
  required VoidCallback onPressed,
  required Widget child,
}) {
  return Flushbar(
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    flushbarPosition: FlushbarPosition.TOP,
    message: message,
    duration: const Duration(seconds: 3),
    mainButton: TextButton(onPressed: onPressed, child: child),
    backgroundColor: Colors.black87,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(12),
  )..show(context);
}
