import 'package:flutter/material.dart';

class NoticeItem extends StatelessWidget{

  final String Link;
  final String Date;
  final String subTitle;
  final Function onPress;

  const NoticeItem({Key key, this.Link, this.Date, this.subTitle, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Card(
      margin:EdgeInsets.only(top: 10),
      child: new InkWell(
        onTap: () {
          onPress();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
              child: Text(Date),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              child: Divider(
                height: 1.0,
//              indent: 60.0
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
              child: Text(
                subTitle,
                style: new TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),

          ],
        ),
      )
    );
  }

}