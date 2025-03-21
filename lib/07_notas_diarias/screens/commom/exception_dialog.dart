import 'package:flutter/material.dart';

showExceptionDialog(BuildContext context,
    {required String content, String title = "Um problema aconteceu"}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.brown,
              ),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.brown),
              ),
            ],
          ),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Ok",
                  style: TextStyle(
                      color: Colors.brown, fontWeight: FontWeight.bold)),
            )
          ],
        );
      });
}
