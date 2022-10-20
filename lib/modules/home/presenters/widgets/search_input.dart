import 'package:flutter/material.dart';
import 'package:ifood_clone/themes/app_colors/app_colors.dart';
import 'package:ifood_clone/themes/app_text_styles/app_text_styles.dart';

class SearchInput extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  const SearchInput(
      {super.key,
      required this.onChanged,
      required this.validator,
      required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      style: AppTextStyles.inputBlack,
      decoration: InputDecoration(
        hintStyle: AppTextStyles.inputBlack,
        hintText: 'Buscar endereço e número',
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.primary,
        ),
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppColors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppColors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppColors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
