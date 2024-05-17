import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management/ui/common/app_colors.dart';

TextStyle get ktsTitleText => GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
      color: kcPrimaryColorDark,
    );

TextStyle get ktsBodyRegular => GoogleFonts.inter(
      fontSize: 14,
      color: kcPrimaryColorDark,
    );

TextStyle get ktsBodyLarge => GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: kcPrimaryColorDark,
    );
