import 'package:flutter/material.dart';

class AllScreenText extends StatelessWidget {
  final String text;
  final Size size;
  final TextStyle? textStyle;

  const AllScreenText({
    super.key,
    required this.size,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
