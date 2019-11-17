import 'package:golib_flutter/Api/Api.dart';
import 'package:golib_flutter/utils/HttpUtil.dart';

class PatchaSpider{
  String formatString(String str){
    String returnStr = str.replaceAll("\"", "");//这里有问题，其实只需要去前后引号即可
    returnStr = returnStr.replaceAll("\n", "");
    returnStr = returnStr.replaceAll(" ", "");
    return returnStr;
  }

  getImg() async {
    String Api = Api_Manage.GETPATCHA;
    var rep = HttpUtil.getInstance().get(Api);
  }

}