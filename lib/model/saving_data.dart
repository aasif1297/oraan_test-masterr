class SavingData {
  String userId;
  String lifeTimeSavings;

  SavingData({this.userId, this.lifeTimeSavings});

  SavingData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    lifeTimeSavings = json['lifeTimeSavings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['lifeTimeSavings'] = this.lifeTimeSavings;
    return data;
  }
}
