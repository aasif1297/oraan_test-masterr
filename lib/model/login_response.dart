import 'package:oraan_project/model/data.dart';

class LoginResponse {
  final int status;
  final String message;
  final Data data;


  LoginResponse(this.status, this.message, this.data);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = Data.fromJson(json['data']);


  LoginResponse.withError(String errorValue)
      : status = 0,
        message = errorValue,
        data = Data();


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
