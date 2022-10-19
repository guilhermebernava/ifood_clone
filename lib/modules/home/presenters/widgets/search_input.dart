import 'package:flutter/material.dart';

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
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        hintText: 'Buscar endereço e número',
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Colors.red,
        ),
        filled: true,
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
