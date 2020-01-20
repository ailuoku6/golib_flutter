import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:golib_flutter/pages/home/home_page.dart';
import 'package:golib_flutter/pages/login/login_page.dart';
import 'package:golib_flutter/pages/searchPage/search_page.dart';
import 'package:golib_flutter/pages/searchResult/search_result.dart';
import 'package:golib_flutter/pages/noticeDetail/notice_detail.dart';

var homeHandle = new Handler(handlerFunc: (BuildContext context,Map<String,List<Object>> params){
  return HomePage();
});

var loginHandle = new Handler(handlerFunc: (BuildContext context,Map<String,List<Object>> params){
  return LoginPage();
});

var searchHandle = new Handler(handlerFunc: (BuildContext context,Map<String,List<Object>> params){
  return SearchPage();
});

var searchResultHandle = new Handler(handlerFunc: (BuildContext context,Map<String,List<Object>> params){
  return searchResult(params["kw"][0]);
});
var noticeDetailHandle = new Handler(handlerFunc: (BuildContext context,Map<String,List<Object>> params){
  return noticeDetail(Uri.decodeComponent(params['url'][0]));
});