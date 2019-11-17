import 'dart:developer';

import 'package:golib_flutter/Api/Api.dart';
import 'package:golib_flutter/route/route_handles.dart';
import 'package:golib_flutter/utils/HttpUtil.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class HotBookSpider{

  String formatString(String str){
    String returnStr = str.replaceAll("\"", "");//这里有问题，其实只需要去前后引号即可
    returnStr = returnStr.replaceAll("\n", "");
    returnStr = returnStr.replaceAll(" ", "");
    return returnStr;
  }

  Future<List<String>> GetHotbook() async{

    List<String> bookNames = new List();
    log("热门图书"+bookNames.toString());

    String Api = Api_Manage.HOTBOOK;
    String rep = await HttpUtil.getInstance().get(Api);
    log("热门图书"+rep);
    var document = parse(rep);
//    log("热门图书"+document.getElementById("hottag").toString());
    List<Element> elements = document.querySelectorAll("a");

    log("热门图书"+elements.toString());
    for(var item in elements){
//      log("热门图书"+item.firstChild.toString());
      bookNames.add(formatString(item.firstChild.toString()));
    }

//    log("热门图书"+bookNames.toString());

    return bookNames;
  }
}