import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String text, {bool isError = false}) {
  final Color backgroundColor = isError ? Colors.red : Colors.green;
  final Icon icon = isError ? Icon(Icons.error, color: Colors.white) : Icon(Icons.check_circle, color: Colors.white);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          icon,
          SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(color: Colors.white))),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      duration: Duration(seconds: 3),
    ),
  );
}
