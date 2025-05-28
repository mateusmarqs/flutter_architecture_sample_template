import 'package:flutter/material.dart';

abstract final class Dimensions {
  const Dimensions();

  double get paddingScreenHorizontal;
  double get paddingScreenVertical;

  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
        vertical: paddingScreenVertical,
      );

  static const Dimensions desktop = _DimensionsDesktop();
  static const Dimensions mobile = _DimensionsMobile();
  static const Dimensions tablet = _DimensionsTablet();

  factory Dimensions.of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1200) {
      return desktop;
    } else if (width > 600) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

final class _DimensionsMobile extends Dimensions {
  @override
  final double paddingScreenHorizontal = 18.0;

  @override
  final double paddingScreenVertical = 24.0;

  const _DimensionsMobile();
}

final class _DimensionsDesktop extends Dimensions {
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  const _DimensionsDesktop();
}

final class _DimensionsTablet extends Dimensions {
  @override
  final double paddingScreenHorizontal = 50.0;

  @override
  final double paddingScreenVertical = 32.0;

  const _DimensionsTablet();
}
