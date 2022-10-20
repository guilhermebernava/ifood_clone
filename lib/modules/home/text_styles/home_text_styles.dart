import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifood_clone/themes/app_colors/app_colors.dart';

class HomeTextStyles {
  static final homeTitle = GoogleFonts.openSans(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final bottomSheetTitle = GoogleFonts.openSans(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final myLocationTitle = GoogleFonts.openSans(
    color: AppColors.black,
    fontSize: 16,
  );

  static final myLocationSubTitle = GoogleFonts.openSans(
    color: AppColors.lightBlack,
    fontSize: 14,
  );
}
