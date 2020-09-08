import 'package:dio/dio.dart';
import 'package:oraan_project/model/login_response.dart';
import 'package:oraan_project/model/savings_response.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class Auth {
  static SharedPreferences sharedPreferences;
  final Dio _dio = Dio();

  Future<LoginResponse> doLogin(email, password, context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var url = Api.login;
    var body = {"userPhone": "$email", "userPassword": "$password"};
    try {
      _dio.options.headers['content-Type'] = 'application/json';
      Response response = await _dio.post(url, data: body);
      return LoginResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return LoginResponse.withError(error);
    }
  }

  Future<SavingResponse> getSavings(user_id) async {
    sharedPreferences = await SharedPreferences.getInstance();

    var url = Api.savings;
    var params = {"user_id": "$user_id"};
    try {
      Response response = await _dio.get(url, queryParameters: params);
      return SavingResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SavingResponse.withError("$error");
    }
  }
}
