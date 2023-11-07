import 'package:flutter/material.dart';

Widget CustomTextButtom({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    );
