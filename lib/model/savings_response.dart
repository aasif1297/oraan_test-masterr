import 'package:oraan_project/model/saving_data.dart';

class SavingResponse {
  final int status;
  final String message;
  final SavingData data;

  SavingResponse(this.status, this.message, this.data);

  SavingResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = SavingData.fromJson(json['data']);

  SavingResponse.withError(String errorValue)
      : status = 0,
        message = errorValue,
        data = SavingData();

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
