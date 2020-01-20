import 'package:golib_flutter/Api/Api.dart';
import 'package:golib_flutter/Model/Notice.dart';
import 'package:golib_flutter/utils/HttpUtil.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:golib_flutter/utils/HtmlTransformer.dart';

class NoticeDetailSpider{

  String formatString(String str){
    String returnStr = str.replaceAll("\"", "");//这里有问题，其实只需要去前后引号即可
    returnStr = returnStr.replaceAll("\n", "");
    returnStr = returnStr.replaceAll(" ", "");
    return returnStr;
  }

  Future<String> getNoticeDetail(url) async {
    String content = '';
    String rep = await HttpUtil.getInstance().get(url);
    var document = parse(rep.toString());
    content = document.querySelector("#content").querySelector("tbody").querySelector("table").outerHtml;
//    print(content);

    content  = HtmlTransformer.START_LIBRARY_NOTIFICATION + content + HtmlTransformer.END_LIBRARY_NOTIFICATION;
    return content;
  }

}