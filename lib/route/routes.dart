import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:golib_flutter/pages/login/login_page.dart';
import 'route_handles.dart';

class Routes{
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String search = "/search";
  static String searchResult = "/searchResult/:kw";
  static String noticeDetail = "/noticeDetail/:url";
  static String myBorrow = "/myBorrow";

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(handlerFunc: (BuildContext context,Map<String,List<String>> params){
      return LoginPage();
    });

    router.define(home, handler:homeHandle);
    router.define(login, handler: loginHandle);
    router.define(search, handler: searchHandle);
    router.define(searchResult, handler: searchResultHandle);
    router.define(noticeDetail, handler: noticeDetailHandle);
    router.define(myBorrow, handler: myBorrowHandle);
  }
}