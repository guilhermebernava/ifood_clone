import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.red,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
