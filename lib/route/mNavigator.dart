import 'package:fluro/fluro.dart';
import 'package:golib_flutter/utils/fluro_convert_utils.dart';
import 'package:golib_flutter/application.dart';
import 'package:flutter/material.dart';
import 'package:golib_flutter/route/routes.dart';

class NavigatorUtil{
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        Duration transitionDuration = const Duration(milliseconds: 250),
        RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  static void goLoginPage(BuildContext context,{clearStack:true}) {
    _navigateTo(context, Routes.login, clearStack: clearStack);
  }

  static void goHomePage(BuildContext context){
    _navigateTo(context, Routes.home,clearStack: true);
  }
}