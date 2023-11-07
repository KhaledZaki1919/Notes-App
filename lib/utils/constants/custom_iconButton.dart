import 'package:flutter/material.dart';

Widget CustomIconButton({
  required Function function,
  required IconData iconData,
}) =>
    IconButton(
        onPressed: () {
          function();
        },
        icon: Icon(
          iconData,
          color: Colors.black,
          size: 30.0,
        ));
