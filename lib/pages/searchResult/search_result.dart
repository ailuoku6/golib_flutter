import 'package:flutter/material.dart';

class searchResult extends StatefulWidget{
  String kw;
  searchResult(this.kw);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new searchResultState();
  }

}

class searchResultState extends State<searchResult> with TickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.kw+"的搜索结果"),
      ),

    );
  }

}