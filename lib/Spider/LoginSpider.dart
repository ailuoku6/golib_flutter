import 'dart:developer';
import 'dart:io';

import 'package:golib_flutter/Api/Api.dart';
import 'package:golib_flutter/Model/LoginState.dart';
import 'package:golib_flutter/application.dart';
import 'package:golib_flutter/utils/HttpUtil.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class LoginSpider{

  String formatString(String str){
    String returnStr = str.replaceAll("\"", "");//这里有问题，其实只需要去前后引号即可
    returnStr = returnStr.replaceAll("\n", "");
    returnStr = returnStr.replaceAll(" ", "");
    return returnStr;
  }

  Future<LoginState> Login(String userName,String passWord) async{
    String Api = Api_Manage.LOGIN_URL;

    LoginState loginState;

//    Map<String,String> data = new Map();
//    data["number"] = userName;
//    data["passwd"] = passWord;

//    List<Cookie> newCookies = new List();
//
//    HttpUtil.getInstance().cookieJar.saveFromResponse(Uri.parse(Api), newCookies);

    Map<String, dynamic> data = new Map();
    data["number"] = userName;
    data["passwd"] = passWord;
    data["select"] = "bar_no";

    String rep = await HttpUtil.getInstance().post(Api,data: data);
    log("resp"+rep);
    var document = parse(rep);
    Element element = document.getElementById("fontMsg");

    if(element==null){

    }else{

    }
  }

}