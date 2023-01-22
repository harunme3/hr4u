import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String chooseLogin = "/";
  static const String login = "login";
  static const String about = "about";
  static const String style = "style";
  static const String allScreen = "allScreen";

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }
}
