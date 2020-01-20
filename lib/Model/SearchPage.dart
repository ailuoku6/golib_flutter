import 'package:golib_flutter/Model/Book.dart';

class SearchPage{
  String _pre;
  String _next;
  String _num_pages;
  String _resultCount;
  List<Book> _books;

  SearchPage(this._pre, this._next, this._num_pages, this._resultCount,
      this._books);

  List<Book> get books => _books;

  set books(List<Book> value) {
    _books = value;
  }

  String get resultCount => _resultCount;

  set resultCount(String value) {
    _resultCount = value;
  }

  String get num_pages => _num_pages;

  set num_pages(String value) {
    _num_pages = value;
  }

  String get next => _next;

  set next(String value) {
    _next = value;
  }

  String get pre => _pre;

  set pre(String value) {
    _pre = value;
  }


}