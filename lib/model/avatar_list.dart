class AvatarList {
  int code;
  String message;
  List<Data> data;

  AvatarList({this.code, this.message, this.data});

  AvatarList.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int iD;
  String avatarUrl;
  String avatarName;
  int sortNo;
  bool isEnable;

  Data({this.iD, this.avatarUrl, this.avatarName, this.sortNo, this.isEnable});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    avatarUrl = json['AvatarUrl'];
    avatarName = json['AvatarName'];
    sortNo = json['SortNo'];
    isEnable = json['IsEnable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['AvatarUrl'] = this.avatarUrl;
    data['AvatarName'] = this.avatarName;
    data['SortNo'] = this.sortNo;
    data['IsEnable'] = this.isEnable;
    return data;
  }
}