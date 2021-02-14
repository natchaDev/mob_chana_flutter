import 'package:flutter/widgets.dart' as root;

enum LayoutType {
  mobile,
  tablet,
}

class AppMediaQuery {
  LayoutType getLayoutType(root.BuildContext context) {
    if (root.MediaQuery.of(context).size.width > 600) {
      return LayoutType.tablet;
    } else {
      return LayoutType.mobile;
    }
  }
}
