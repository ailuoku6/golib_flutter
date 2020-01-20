import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:golib_flutter/Spider/NoticeDetailSpider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class noticeDetail extends StatefulWidget{
  String url;
  noticeDetail(this.url);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new noticeDetailState();
  }

}

class noticeDetailState extends State<noticeDetail> with TickerProviderStateMixin{


  String _detailhtml = '';

  WebViewController _webViewController = null;

  void _inithtml() async{
    _detailhtml = await NoticeDetailSpider().getNoticeDetail(widget.url);
    setState(() {
      _detailhtml;
    });

    if(_webViewController!=null) {
      String contentBase64 = base64Encode(const Utf8Encoder().convert(_detailhtml));
      _webViewController.loadUrl('data:text/html;base64,$contentBase64');
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    _inithtml();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

//    print(_detailhtml);

    return Scaffold(
      appBar: AppBar(
        title: new Text("通知详情"),
      ),
      body: WebView(
//          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            String contentBase64 = base64Encode(const Utf8Encoder().convert(_detailhtml));
            webViewController.loadUrl('data:text/html;base64,$contentBase64');
            _webViewController = webViewController;
            setState(() {
              _webViewController;
            });
          }
      ),
    );
  }

}