
import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Utils {

  static hideLoader(BuildContext context) {
    if (context.loaderOverlay
        .visible /* && context.loaderOverlay.overlayWidgetType == ReconnectingOverlay*/) {
      context.loaderOverlay.hide();
    }
  }

  static showLoader(BuildContext context) {
    context.loaderOverlay.show();
  }

}