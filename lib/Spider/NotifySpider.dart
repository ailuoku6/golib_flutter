import 'package:golib_flutter/Api/Api.dart';
import 'package:golib_flutter/Model/Notice.dart';
import 'package:golib_flutter/utils/HttpUtil.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class NotifySpider{
  
  String formatString(String str){
    String returnStr = str.replaceAll("\"", "");//这里有问题，其实只需要去前后引号即可
    returnStr = returnStr.replaceAll("\n", "");
    returnStr = returnStr.replaceAll(" ", "");
    return returnStr;
  }
  
//  Future<List<Notice>> getNotice() async {
//    var Api = Api_Manage.LIB_HOME;
//    List<Notice> notices = new List();
//    String rep = await HttpUtil.getInstance().get(Api);
//    var document = parse(rep.toString());
//    var items = document.querySelector("#gonggao").querySelectorAll("tr > td");
//    for(var item in items){
//      var attrs = item.querySelector("a").attributes;
//      Notice notice = new Notice(formatString(item.querySelector("a").firstChild.toString()), Api+attrs["href"],formatString(item.querySelector("font").firstChild.toString()));
//      notices.add(notice);
//    }
//
//    return notices;
//  }

  Future<List<Notice>> getNotice() async {
    var Api = Api_Manage.NOTIFY;
    String rep = await HttpUtil.getInstance().get(Api);

    var document = parse(rep.toString());

    List<Notice> notices = new List();

    Element wrap = document.getElementById("content").querySelectorAll("tbody")[0].querySelectorAll("tr")[0].querySelectorAll("td")[1].querySelectorAll("div")[3];
    List<Element> elements = wrap.children;
    for(var item in elements){
      Element a = item.querySelectorAll("a")[0];
      var attrs = a.attributes;
      String href = "http://www.lib.wust.edu.cn/bullet/" + attrs["href"];
      String title = formatString(a.firstChild.toString());
      Element date = item.querySelectorAll("div").last;
      String notificationDate = formatString(date.firstChild.toString());

      Notice notice = new Notice(title,href,notificationDate);
      notices.add(notice);
    }

    return notices;
  }
}