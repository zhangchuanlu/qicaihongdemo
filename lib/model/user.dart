class User {
  int code;
  String message;
  UserInfo data;

  User({this.code, this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
    data = json['Data'] != null ? new UserInfo.fromJson(json['Data']) : null;
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

class UserInfo {
  int id;
  String mobile;
  String password;
  String realName;
  String userName;
  String gender;
  double balance;
  String iDCard;
  String parentName;
  String createTime;
  int status;
  int parentUserID;
  String imageUrl;
  bool isAuthentication;
  bool isBinded;
  bool isSetPassword;

  UserInfo(
      {this.id,
        this.mobile,
        this.password,
        this.realName,
        this.userName,
        this.gender,
        this.balance,
        this.iDCard,
        this.parentName,
        this.createTime,
        this.status,
        this.parentUserID,
        this.imageUrl,
        this.isAuthentication,
        this.isBinded,
        this.isSetPassword});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    mobile = json['Mobile'];
    password = json['Password'];
    realName = json['RealName'];
    userName = json['UserName'];
    gender = json['Gender'];
    balance = json['Balance'];
    iDCard = json['IDCard'];
    parentName = json['ParentName'];
    createTime = json['CreateTime'];
    status = json['Status'];
    parentUserID = json['ParentUserID'];
    imageUrl = json['ImageUrl'];
    isAuthentication = json['IsAuthentication'];
    isBinded = json['IsBinded'];
    isSetPassword = json['IsSetPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Mobile'] = this.mobile;
    data['Password'] = this.password;
    data['RealName'] = this.realName;
    data['UserName'] = this.userName;
    data['Gender'] = this.gender;
    data['Balance'] = this.balance;
    data['IDCard'] = this.iDCard;
    data['ParentName'] = this.parentName;
    data['CreateTime'] = this.createTime;
    data['Status'] = this.status;
    data['ParentUserID'] = this.parentUserID;
    data['ImageUrl'] = this.imageUrl;
    data['IsAuthentication'] = this.isAuthentication;
    data['IsBinded'] = this.isBinded;
    data['IsSetPassword'] = this.isSetPassword;
    return data;
  }
}