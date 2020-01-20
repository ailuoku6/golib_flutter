class Book_hist{
  String _name;
  String _zuozhe;
  String _guancangdi;
  String _borrowDate;
  String _returnDate;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get zuozhe => _zuozhe;

  String get returnDate => _returnDate;

  set returnDate(String value) {
    _returnDate = value;
  }

  String get borrowDate => _borrowDate;

  set borrowDate(String value) {
    _borrowDate = value;
  }

  String get guancangdi => _guancangdi;

  set guancangdi(String value) {
    _guancangdi = value;
  }

  set zuozhe(String value) {
    _zuozhe = value;
  }

}