import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:golib_flutter/route/mNavigator.dart';

class SplashPage extends StatefulWidget{
  @override
  _SplashPageState createState()=>_SplashPageState();

}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{

//  void  _onAdd(){
//    setState(() {
//      _title = "hello";
//    });
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      goPage();
    });
  }

  void goPage() async{
    log("to login");
    NavigatorUtil.goHomePage(context);
  }

  @override
  Widget build(BuildContext context) {

    log("run here");
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
//        title: Text("test"),
//      ),
      body: Center(
        child: Text("welcome to wustLib"),
      )
//      floatingActionButton: FloatingActionButton( //悬浮按钮
//          child: Icon(Icons.add),
//          onPressed:_onAdd
//      ),
    );
  }

}