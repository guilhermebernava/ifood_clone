import 'package:flutter/material.dart';

class LocationErrorWidget extends StatelessWidget {
  const LocationErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Oops... algo deu errado'),
    );
  }
}
