import 'package:flutter/material.dart';

class CustomCardWidgets extends StatelessWidget {
  final String text;
  final Color color;

  const CustomCardWidgets({
    super.key, required this.text, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 70,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        margin: EdgeInsets.zero,
        color: color,
        elevation: 0,
        child: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}