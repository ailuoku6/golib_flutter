
import 'package:flutter/material.dart';
import 'package:golib_flutter/Spider/HotBookSpider.dart';
import 'package:golib_flutter/route/mNavigator.dart';

class SearchPage extends StatefulWidget{
  @override
  _SearchPageState createState()=>_SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin{

  List<String> _hotBooks = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHotbook();
  }

  _getHotbook() async {
    List<String> rep = await HotBookSpider().GetHotbook();
    _hotBooks = rep;
//    log("热门图书"+_hotBooks.toString());
    setState(() {
      _hotBooks;
    });
  }

  List<Widget> _hotbookWidget(){
    List<Widget> hotbooks = new List();
    for(var item in _hotBooks){
      hotbooks.add(
        new Chip(
          label: InkWell(
            child: new Text(item),
            onTap: (){
              _keywordController.text = item;
              _SearchBook();
            },
          ),
        ),
      );
    }
    return hotbooks;
  }

  TextEditingController _keywordController = new TextEditingController();

  _SearchBook(){
    String keyWord = _keywordController.text;
    NavigatorUtil.goSearchResult(context,kw: keyWord!=null?keyWord:"");
//    NavigatorUtil.Back(context);
  }

  Widget searchInput() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new FlatButton.icon(
              onPressed: (){
                NavigatorUtil.Back(context);
              },
              icon: new Icon(Icons.arrow_back, color: Colors.black54),
              label: new Text(""),
            ),
            width: 60.0,
          ),
          new Expanded(
            child: new TextField(
              textInputAction:TextInputAction.search,
              autofocus: true,
              controller: _keywordController,
              decoration: new InputDecoration.collapsed(
                  hintText: "馆藏搜索",
                  hintStyle: new TextStyle(color: Colors.black54)
              ),
              onEditingComplete: _SearchBook,
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: Colors.white
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar:new AppBar(
        leading: null,
        automaticallyImplyLeading:false,
        title: searchInput(),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Text("热门图书", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              margin: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
              alignment: Alignment.topLeft,
            ),
            new Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
              child: new Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.start,
                children: _hotbookWidget()
              ),
            ),

          ],
        ),
      ),
    );
  }

}