import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget padding([EdgeInsetsGeometry padding = const EdgeInsets.all(24)]) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget sliverPadding([
    EdgeInsetsGeometry padding = const EdgeInsets.all(24),
  ]) {
    return SliverPadding(
      padding: padding,
      sliver: this,
    );
  }
}
