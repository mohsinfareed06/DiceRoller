import 'package:flutter/material.dart';
import 'package:new_project/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 177, 32, 32),
          Color.fromARGB(255, 11, 238, 60),
        ),
      ),
    ),
  );
}
