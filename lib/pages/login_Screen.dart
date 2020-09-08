import 'package:flutter/material.dart';
import 'package:oraan_project/bloc/get_auth_bloc.dart';
import 'package:oraan_project/model/data.dart';
import 'package:oraan_project/model/login_response.dart';
import 'package:oraan_project/networking/auth.dart';
import 'package:oraan_project/pages/home_screen.dart';
import 'package:oraan_project/pages/navigation_bar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible;
  TextEditingController _phoneController;
  TextEditingController _passCodeController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  LoginResponse _loginResponse;
  bool _loading = false;
  SharedPreferences _sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneController = TextEditingController();
    _passCodeController = TextEditingController();
    setState(() {
      _passwordVisible = true;
    });
  }

  void showInSnackBar(String value) {
    print(value);
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(child: _mainWidget()),
    );
  }

  Widget _mainWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF992B4655),
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Welcome back.",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            _textField(false, true, TextInputType.phone, "Phone Number", false,
                _phoneController),
            SizedBox(
              height: 30,
            ),
            _textField(_passwordVisible, true, TextInputType.visiblePassword,
                "Passcode", true, _passCodeController),
            SizedBox(
              height: 30,
            ),
            _raisedButton(),
            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Text("Forgot Password".toUpperCase(),
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Noto Sans HK',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor)),
            )
          ],
        ),
      ),
    );
  }

  Widget _raisedButton() {
    return (!_loading)
        ? RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Text("Login".toUpperCase(),
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Noto Sans HK',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.25,
                      color: Colors.white)),
            ),
            onPressed: () async {
              _loginResponse = await _login();
              if (_loginResponse != null) {
                if (_loginResponse.data.userId != null &&
                    _loginResponse.data.message == "user login success") {
                  saveUserID(_loginResponse.data.userId);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => NavBarScreen()),
                      (Route<dynamic> route) => false);
                } else {
                  showInSnackBar(_loginResponse.data.message);
                }
              }//
            })
        : RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Theme.of(context).primaryColor,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                child: SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 4.0,
                  ),
                )),
            onPressed: () async {
              _loginResponse = await _login();

              if (_loginResponse.data.userId != null &&
                  _loginResponse.data.message == "user login success") {
                saveUserID(_loginResponse.data.userId);
                setState(() {
                  _loading = false;
                });
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => NavBarScreen()),
                    (Route<dynamic> route) => false);
              } else {
                setState(() {
                  _loading = false;
                });
                showInSnackBar(_loginResponse.data.message);
              }
            });
  }

  Future<LoginResponse> _login() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _loading = true;
    });

    var phone = _phoneController.text;
    var password = _passCodeController.text;

    var error = await Auth().doLogin(phone, password, context);

    if (error != null) {
      setState(() {
        _loading = false;
      });

      return error;
    }
  }

  saveUserID(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', userId);
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _textField(bool _obscure, bool _enabled, TextInputType _textInputType,
      String text, bool isPassword, TextEditingController _controller) {
    return TextField(
      controller: _controller,
      obscureText: _obscure,
      enabled: _enabled,
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      autofocus: false,
      keyboardType: _textInputType,
      style: Theme.of(context).textTheme.subtitle1,
      decoration: new InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Color(0xFF1F000000)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
        hintText: text,
        hintStyle: Theme.of(context).textTheme.subtitle1,
        suffixIcon: (isPassword)
            ? IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }
}
