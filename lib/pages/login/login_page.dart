import 'package:flutter/material.dart';
import 'package:golib_flutter/Spider/LoginSpider.dart';
import 'package:golib_flutter/Spider/PatchaSpider.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = true; //密码是否显示明文

  _LoginPageState(){
//    new PatchaSpider().getImg();
  }

  _handleLogin() async {
    String userName = _unameController.text;
    String passWord = _pwdController.text;

    var rep = await LoginSpider().Login(userName, passWord);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("登录"),
        backgroundColor:new Color(0x00000000),
        elevation:0
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 80),
        child: Card(
            elevation: 5,
            child:Container(
              margin: EdgeInsets.all(16),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Text("LOGIN",style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.w500
                  ),),
                  TextField(
                    controller: _unameController,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "用户名",
//                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person)
                    ),
                  ),
                  TextField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                        labelText: "密码",
//                        hintText: "您的登录密码",
                        prefixIcon: Icon(Icons.lock)
                    ),
                    obscureText: pwdShow,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("登录"),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: ()=>_handleLogin(),
                  )
                ],
              ),
            )
        ),
      )
    );
  }

}