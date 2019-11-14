import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:golib_flutter/pages/home/home_page.dart';
import 'package:golib_flutter/pages/login/login_page.dart';

var homeHandle = new Handler(handlerFunc: (BuildContext context,Map<String,List<Object>> params){
  return HomePage();
});

var loginHandle = new Handler(handlerFunc: (BuildContext context,Map<String,List<Object>> params){
  return LoginPage();
});