import 'package:flutter/material.dart';

class BottomSheetServices {
  static Future<dynamic> showAllScreenBottomSheet(
    Widget widget,
    BuildContext context,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: ((context) => widget),
    );
  }
}
