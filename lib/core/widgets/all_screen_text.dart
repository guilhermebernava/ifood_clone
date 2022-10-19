import 'package:flutter/material.dart';

class AllScreenText extends StatelessWidget {
  final String text;
  final Size size;
  const AllScreenText({
    super.key,
    required this.size,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
