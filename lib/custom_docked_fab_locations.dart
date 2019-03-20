
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class CustomDockedFABLocation {
  static const FloatingActionButtonLocation leftDocked = _LeftDockedFloatingActionButtonLocation();
  static const FloatingActionButtonLocation centerDocked = _CenterDockedFloatingActionButtonLocation();
  static const FloatingActionButtonLocation rightDocked = _RightDockedFloatingActionButtonLocation();
}

abstract class _CustomDockedFloatingActionButtonLocation extends FloatingActionButtonLocation {
  const _CustomDockedFloatingActionButtonLocation();

  // Positions the Y coordinate of the [FloatingActionButton] at a height
  // where it docks to the [BottomAppBar].
  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight / 2.0;
    // The FAB should sit with a margin between it and the snack bar.
    if (snackBarHeight > 0.0)
      fabY = math.min(fabY, contentBottom - snackBarHeight - fabHeight - kFloatingActionButtonMargin);
    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0)
      fabY = math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return math.min(maxFabY, fabY);
  }
}

class _RightDockedFloatingActionButtonLocation extends _CustomDockedFloatingActionButtonLocation {
  const _RightDockedFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width - 235.0) / 2.0;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  @override
  String toString() => 'FloatingActionButtonLocation.centerDocked';
}

class _CenterDockedFloatingActionButtonLocation extends _CustomDockedFloatingActionButtonLocation {
  const _CenterDockedFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width + 10) / 2.0;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  @override
  String toString() => 'FloatingActionButtonLocation.centerDocked';
}

class _LeftDockedFloatingActionButtonLocation extends _CustomDockedFloatingActionButtonLocation {
  const _LeftDockedFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = ((scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width + 225.0) / 2.0);
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  @override
  String toString() => 'FloatingActionButtonLocation.centerDocked';
}
