import 'package:flutter/material.dart';

Widget CustomTextTitle({
  required String text,
  required double fontsize,
  FontWeight? fontWeight,
  int? maxlines,
  TextOverflow? textOverflow,
}) =>
    Text(
      text,
      overflow: textOverflow,
      maxLines: maxlines,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
Widget CustomTextP({
  required String text,
  required double fontsize,
  FontWeight? fontWeight,
}) =>
    Text(
      text,
      style: TextStyle(
        color: Colors.black87,
        fontWeight: fontWeight,
        fontSize: fontsize,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
