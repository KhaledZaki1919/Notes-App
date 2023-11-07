import 'package:flutter/material.dart';

Widget CustomCircAvatar() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 2,
          color: Colors.grey,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CircleAvatar(
            radius: 33,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: Icon(Icons.home),
            ),
          ),
        ),
        Container(
          width: 120,
          height: 2,
          color: Colors.grey,
        ),
      ],
    );
