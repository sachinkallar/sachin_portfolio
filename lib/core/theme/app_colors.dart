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

  // Glass UI Colors
  static const Color glassBorder = Color(0x4DFFFFFF); // 30% White
  static const Color glassSurface = Color(0x1AFFFFFF); // 10% White
  static const Color glassShadow = Color(0x66000000); // 40% Black

  // Liquid Blob Colors
  static const Color blob1 = Color(0xFF7C4DFF); // Deep Purple
  static const Color blob2 = Color(0xFF00E5FF); // Cyan
  static const Color blob3 = Color(0xFFFF4081); // Pink
}
