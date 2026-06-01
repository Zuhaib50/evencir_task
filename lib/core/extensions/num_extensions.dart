import 'package:flutter/widgets.dart';

import 'context_extensions.dart';

extension NumExtensions on num {
  double sp(BuildContext context) => (this / 375) * context.screenWidth;

  SizedBox get verticalSpace => SizedBox(height: toDouble());
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}
