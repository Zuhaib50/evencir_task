import 'package:flutter/widgets.dart';

class Responsive {
  Responsive(this.context);

  final BuildContext context;

  Size get _size => MediaQuery.of(context).size;

  double get width => _size.width;
  double get height => _size.height;
  EdgeInsets get safeArea => MediaQuery.of(context).padding;

  double get horizontalPadding => width * 0.06;

  static int gridColumns(double maxWidth) {
    if (maxWidth >= 900) return 3;
    if (maxWidth >= 600) return 2;
    return 2;
  }
}
