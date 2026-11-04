import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Composant réutilisable pour afficher des icônes vectorielles SVG (Design System AutoLoc).
class VipSvgIcon extends StatelessWidget {
  final String assetName;
  final double size;
  final Color? color;
  final BoxFit fit;

  const VipSvgIcon(
    this.assetName, {
    super.key,
    this.size = 20,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$assetName.svg',
      width: size,
      height: size,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
