import 'package:golib_flutter/Api/Api.dart';
import 'package:golib_flutter/Model/SearchPage.dart';
import 'package:golib_flutter/utils/HttpUtil.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class SearchBookSpider{

  SearchPage Parsehtml(String html){

    SearchPage searchPage = new SearchPage(null, null, null, null, null);

    var docuemnt = parse(html);
    List<Element> elements = docuemnt.querySelectorAll(".book_list_info");

    for(var item in elements){

    }

    return searchPage;

  }

  Future<SearchPage> getSearchbook(String keyWord) async{
    var Api = Api_Manage.SEARCH_BOOK;
    Map<String, dynamic> data = new Map();
    data["strSearchType"] = "title";
    data["strText"] = keyWord;
    data["loginsubmit.x"] = "51";
    data["loginsubmit.y"] = "10";
    var rep = HttpUtil.getInstance().get(Api,data: data);
    return Parsehtml(rep);
  }
}