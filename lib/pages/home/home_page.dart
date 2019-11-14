import 'package:flutter/material.dart';
import 'package:golib_flutter/Api/Api.dart';
import 'package:golib_flutter/Model/Notice.dart';
import 'package:golib_flutter/route/mNavigator.dart';
import 'package:golib_flutter/utils/HttpUtil.dart';
import 'package:golib_flutter/Spider/NotifySpider.dart';
import 'package:golib_flutter/Component/NoticeItem.dart';

class HomeBuilder {
  static Widget homeDrawer(BuildContext context) {
    return new ListView(padding: const EdgeInsets.only(), children: <Widget>[
      _drawerHeader(context),
      new ClipRect(
        child: new ListTile(
          leading: new CircleAvatar(child: new Icon(Icons.book)),
          title: new Text('我的图书馆'),
          onTap: () => {},
        ),
      ),
      new ListTile(
        leading: new CircleAvatar(child: new Icon(Icons.bookmark)),
        title: new Text('我的借阅'),
//        subtitle: new Text("Drawer item B subtitle"),
        onTap: () => {},
      ),
      new Divider(
        height: 1.0,
      ),
      new ListTile(
          title:Text("关于")
      ),
      new ListTile(
        leading: new CircleAvatar(child: new Icon(Icons.account_box)),
        title: new Text('关于'),
//        subtitle: new Text("Drawer item B subtitle"),
        onTap: () => {},
      ),
    ]);
  }

  static Widget _drawerHeader(BuildContext context) {
    return new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
      accountName: new Text(
        "未登录",
//        style: HStyle.titleNav(),
      ),
//      currentAccountPicture: new Icon(Icons.account_circle,size: 80,),
      currentAccountPicture: new InkWell(
        onTap: ()=>{
          NavigatorUtil.goLoginPage(context,clearStack: false)
        },
        child: new CircleAvatar(
          backgroundImage: new AssetImage("assets/User.png"),
        ),
      ),
//      onDetailsPressed: () {},
//      otherAccountsPictures: <Widget>[
//        new CircleAvatar(
//          backgroundImage: new AssetImage("images/ymj_shuijiao.gif"),
//        ),
//      ],
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  String _context = "gy";
  List<Notice> _notices = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
//    var response = await HttpUtil().get(Api_Manage.LIB_HOME);
//    print("run here"+response.toString());
//    _context = response.toString();
    var res = await NotifySpider().getNotice();
    _context = res.toString();
    _notices = res;
    setState(() {
      _context;
      _notices;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("科大Lib"),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: Icon(Icons.search), onPressed: () {

          }),
        ],
      ),
      drawer: new Drawer(
        child: HomeBuilder.homeDrawer(context),
      ),
      body: Container(
        child: ListView.builder(
            padding: new EdgeInsets.only(left: 10,right: 10,bottom: 10),
            itemCount: _notices.length,
//            itemExtent: 50.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              return new NoticeItem(Link: _notices[index].Link,Date: _notices[index].Date,subTitle: _notices[index].subTitle,onPress: (){
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text(_notices[index].subTitle),
                ));
              });
            }
        )
      ),
    );
  }

}