import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({double h = 0, double v = 0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
        child: this,
      );

  Widget clipRounded(double radius) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
}
