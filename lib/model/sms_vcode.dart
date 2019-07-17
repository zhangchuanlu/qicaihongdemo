class SMSVCode {
  int code;
  String message;
  Data data;

  SMSVCode({this.code, this.message, this.data});

  SMSVCode.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  String grantTime;
  String expireIn;

  Data({this.token, this.grantTime, this.expireIn});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    grantTime = json['GrantTime'];
    expireIn = json['ExpireIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    data['GrantTime'] = this.grantTime;
    data['ExpireIn'] = this.expireIn;
    return data;
  }
}