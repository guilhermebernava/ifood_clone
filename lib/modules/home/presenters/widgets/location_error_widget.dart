import 'package:flutter/material.dart';
import 'package:ifood_clone/modules/home/text_styles/home_text_styles.dart';

class LocationErrorWidget extends StatelessWidget {
  const LocationErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Oops... algo deu errado',
        style: HomeTextStyles.homeTitle,
      ),
    );
  }
}
