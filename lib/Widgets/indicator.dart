import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  // final bool isSquare;
  final double size;
  final Color textColor;
  final double value;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.value,
    // required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String finalVal = value.toStringAsFixed(2);
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          "   ($finalVal %) ",
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
