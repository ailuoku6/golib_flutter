class LoginState{
  bool _Islogin;
  String _ErrMsg;


  LoginState(this._Islogin, this._ErrMsg);

  String get ErrMsg => _ErrMsg;

  set ErrMsg(String value) {
    _ErrMsg = value;
  }

  bool get Islogin => _Islogin;

  set Islogin(bool value) {
    _Islogin = value;
  }

}