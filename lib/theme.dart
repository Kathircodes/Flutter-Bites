// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  primaryColor: Color(0XFFFFAA00),
  // secondaryHeaderColor: Color(0XFF2E3A59),
  scaffoldBackgroundColor: Color(0XFF202b3f),
  cardColor: Color(0XFF2E3A59),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  ),
);
