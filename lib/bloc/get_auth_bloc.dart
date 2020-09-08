import 'package:flutter/cupertino.dart';
import 'package:oraan_project/model/login_response.dart';
import 'package:oraan_project/networking/auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  Auth _auth = Auth();
  BehaviorSubject<LoginResponse> _subject = BehaviorSubject<LoginResponse>();

  getLoginState(String email, String password, BuildContext context) async {
    LoginResponse response = await _auth.doLogin(email, password, context);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<LoginResponse> get subject => _subject;
}

var authBloc = AuthBloc();
