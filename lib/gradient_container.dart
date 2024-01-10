import 'package:flutter/material.dart';
import 'package:new_project/dice_roller.dart';

var StartAlignment = Alignment.topRight;
var EndAlignment = Alignment.bottomLeft;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: StartAlignment,
          end: EndAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
