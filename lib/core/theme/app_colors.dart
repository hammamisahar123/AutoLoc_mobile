import 'package:flutter/material.dart';

/// Palette de couleurs officielle pour AutoLoc (Executive Concierge Mobility).
/// Dérivée des spécifications de conception (DESIGN.md).
abstract class AppColors {
  // Couleurs Principales (Brand)
  static const Color primary = Color(0xFF0B192C); // Midnight Navy
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF1E3E62);
  static const Color onPrimaryContainer = Color(0xFFD6E3FE);

  // Couleurs Secondaires / Accent
  static const Color secondary = Color(0xFFF1B814); // Mustard Gold
  static const Color onSecondary = Color(0xFF0B192C);
  static const Color secondaryContainer = Color(0xFFFEC325);
  static const Color onSecondaryContainer = Color(0xFF5B4300);

  // Couleurs Tertiaires (Cobalt & Nuances)
  static const Color tertiary = Color(0xFF1E3E62); // Cobalt Navy
  static const Color onTertiary = Color(0xFFFFFFFF);

  // Surfaces & Fonds
  static const Color background = Color(0xFFF8FAFC); // Pale Cool Slate
  static const Color surface = Color(0xFFFFFFFF); // Pure White Card
  static const Color surfaceDim = Color(0xFFEFF4FF);
  static const Color surfaceDark = Color(0xFF0B192C); // Dark Card / VIP Card
  static const Color onSurface = Color(0xFF0B1C30);
  static const Color onSurfaceVariant = Color(0xFF64748B); // Cool Slate Text

  // Bordures & Séparateurs
  static const Color outline = Color(0xFFE2E8F0); // Whisper Slate Border
  static const Color outlineLight = Color(0xFFF1F5F9);

  // Statuts (Succès, Erreur, Alerte)
  static const Color success = Color(0xFF16A34A);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color warning = Color(0xFFD97706);

  // Éléments Spécifiques
  static const Color bottomNavBackground = Color(0xF20B192C); // 95% opacity
  static const Color inactiveIcon = Color(0xFF94A3B8);
  static const Color activeIcon = Color(0xFFF1B814);
  static const Color ratingStar = Color(0xFFF1B814);
}
