class Book{
  String _name;
  String _DetailLink;
  String _guancang;
  String _kejie;
  String _author;
  String _chuabanshe;

  Book(this._name, this._DetailLink, this._guancang, this._kejie, this._author,
      this._chuabanshe);

  String get chuabanshe => _chuabanshe;

  set chuabanshe(String value) {
    _chuabanshe = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get kejie => _kejie;

  set kejie(String value) {
    _kejie = value;
  }

  String get guancang => _guancang;

  set guancang(String value) {
    _guancang = value;
  }

  String get DetailLink => _DetailLink;

  set DetailLink(String value) {
    _DetailLink = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}