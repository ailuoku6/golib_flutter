
import 'package:flutter/material.dart';
import 'package:golib_flutter/Model/Book_hist.dart';
import 'package:golib_flutter/Model/Book_lst.dart';

class myBorrow extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new myBorrowState();
  }

}

class myBorrowState extends State<myBorrow> with SingleTickerProviderStateMixin{

  TabController _tabController;

  List tabs = ["当前借阅", "借阅历史"];
  List<Book_lst> _bookLst = new List();
  List<Book_hist> _bookHist = new List();

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Future<void> _getLstData() async {

  }


  Future<void> _getHistData() async {

  }

  Widget BookLstList(){
    Widget widget = Container(
      child: RefreshIndicator(
        onRefresh: _getLstData,
        child: ListView.builder(
            itemCount: _bookLst.length,
            itemBuilder: (BuildContext context, int index){
              return Text(_bookLst[index].name);
            }
        ),
      ),
    );
    return widget;
  }
  
  Widget BookHistList(){
    Widget widget = Container(
      child: RefreshIndicator(
        onRefresh: _getHistData,
        child: ListView.builder(
            itemCount: _bookHist.length,
            itemBuilder: (BuildContext context, int index){
              return Text(_bookHist[index].name);
            }
        ),
      ),
    );
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我的借阅"),
        bottom: TabBar(
          controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()
        ),
      ),
      body: TabBarView(
        controller: _tabController,
          children: tabs.asMap().keys.map((e){
            //获取/更新相应数据
            //判断当前页面并调用显示
            return e==0?BookLstList():BookHistList();
//            return Container(
//              alignment: Alignment.center,
//              child: Text(tabs[e],textScaleFactor: 5),
//            );
          }).toList()
      ),
    );
  }

}