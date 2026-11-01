import 'package:flutter/material.dart';

/// Dimensions, espacements et arrondis officiels du design system AutoLoc.
abstract class AppDimensions {
  // Échelle d'espacement (Base 4px)
  static const double space2xs = 2.0;
  static const double spaceXs = 4.0;
  static const double spaceSm = 8.0;
  static const double spaceMd = 16.0;
  static const double spaceLg = 24.0;
  static const double spaceXl = 32.0;
  static const double space2xl = 40.0;
  static const double space3xl = 48.0;

  // Marges & Gouttières
  static const double screenMargin = 20.0; // 1.25rem
  static const double gutter = 16.0; // 1.0rem
  static const double bottomNavClearance = 88.0; // Espace réservé pour la barre de navigation flottante

  // Rayons d'arrondis (Border Radius)
  static const double radiusSm = 4.0;
  static const double radiusBase = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // BorderRadius objets réutilisables
  static const BorderRadius roundedSm = BorderRadius.all(Radius.circular(radiusSm));
  static const BorderRadius roundedBase = BorderRadius.all(Radius.circular(radiusBase));
  static const BorderRadius roundedMd = BorderRadius.all(Radius.circular(radiusMd));
  static const BorderRadius roundedLg = BorderRadius.all(Radius.circular(radiusLg));
  static const BorderRadius roundedXl = BorderRadius.all(Radius.circular(radiusXl));
  static const BorderRadius roundedFull = BorderRadius.all(Radius.circular(radiusFull));

  // Ombres d'élévation
  static const List<BoxShadow> elevationLevel1 = [
    BoxShadow(
      color: Color(0x0A0B192C),
      offset: Offset(0, 4),
      blurRadius: 20,
      spreadRadius: -2,
    ),
    BoxShadow(
      color: Color(0x050B192C),
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: -1,
    ),
  ];

  static const List<BoxShadow> elevationLevel2 = [
    BoxShadow(
      color: Color(0x140B192C),
      offset: Offset(0, 12),
      blurRadius: 32,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x080B192C),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: -2,
    ),
  ];

  static const List<BoxShadow> elevationLevel3 = [
    BoxShadow(
      color: Color(0x280B192C),
      offset: Offset(0, 20),
      blurRadius: 40,
      spreadRadius: -8,
    ),
  ];
}
