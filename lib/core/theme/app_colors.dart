import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Backgrounds
  static const Color primaryBackground = Color(0xFF0A0F1C); // Deep Navy/Black
  static const Color secondaryBackground = Color(
    0xFF111827,
  ); // Slightly lighter navy

  // Accents
  static const Color primaryAccent = Color(0xFF00E5FF); // Electric Blue
  static const Color secondaryAccent = Color(0xFF64FFDA); // Teal/Cyan
  static const Color purpleAccent = Color(
    0xFF7C4DFF,
  ); // Soft Purple for gradients

  // Text Colors
  static const Color textPrimary = Color(0xFFF9FAFB); // Off-white
  static const Color textSecondary = Color(0xFF9CA3AF); // Light Grey
  static const Color textTertiary = Color(0xFF6B7280); // Darker Grey

  // Functional Colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  // Surface Colors for Cards/Dialogs
  static const Color surface = Color(0xFF1F2937);
}
