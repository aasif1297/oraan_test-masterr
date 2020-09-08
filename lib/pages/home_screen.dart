import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oraan_project/model/savings_response.dart';
import 'package:oraan_project/networking/auth.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SavingResponse _savingResponse;
  bool _loading = false;
  SharedPreferences sharedPreferences;
  int userId;

  Future<void> getSavings(int userId) async {
    setState(() {
      _loading = true;
    });

    var error = await Auth().getSavings("$userId");

    if (error != null) {
      setState(() {
        _loading = false;
      });

      _savingResponse = error;
    }
  }

  @override
  Future<void> initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      userId = sharedPreferences.getInt('user_id');
      if (userId == null) {
        userId = 0;
      } else {
        getSavings(userId).then((value) => print("object"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: (!_loading)
            ? _mainWidget()
            : Center(
                child: SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                    strokeWidth: 4.0,
                  ),
                ),
              ));
  }

  Widget _mainWidget() {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(color: Color(0xFF2D4654)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/profile_placeholder.png"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Juhi Jaferii",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Noto Sans HK',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/saving_art.png",
                  height: 50,
                  width: 50,
                ),
                Text(
                  "Your patience and descipline is paying off!!",
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lifetime Savings",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${_savingResponse.data.lifeTimeSavings}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
