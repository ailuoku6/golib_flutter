class Notice{
  String subTitle;
  String Link;
  String Date;

  Notice(this.subTitle, this.Link, this.Date);

  @override
  String toString() {
    // TODO: implement toString
    Map map = new Map();
    map["subTitle"] = this.subTitle;
    map["Link"] = this.Link;
    map["Date"] = this.Date;
    return map.toString();
  }
}