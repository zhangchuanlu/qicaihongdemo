
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Login{
  Login(this.Data,this.Code,this.Message);
  int Code;
  String Message;
  LoginData Data;
  factory Login.fromJson(Map<String, dynamic> json)=>_$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}



@JsonSerializable()
class LoginData{
  LoginData(this.Ticket,this.User);
  LoginDataUser User;
  LoginDataTicket Ticket;
  factory LoginData.fromJson(Map<String, dynamic> json)=>_$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}




@JsonSerializable()
class LoginDataUser{
  LoginDataUser(this.UserId,this.UserName,this.Status,this.Mobile,this.Gender,this.UserPassword,this.IDCard,
      this.RealName,this.Balance,this.WalletBalance,this.RechargeAmount,this.WithdrawalAmount,this.WithdrawalsPassword,this.PromoterId,this.PromotionComm,
      this.CreateTime,this.ImageUrl,this.IsMember,this.Discount,this.IsExpert,this.LastLoginTime);
  int UserId;
  String UserName;
  int Status;
  String Mobile;
  String Gender;
  String UserPassword;
  String IDCard;
  String RealName;
  double Balance;
  double WalletBalance;
  double RechargeAmount;
  double WithdrawalAmount;
  String WithdrawalsPassword;
  int PromoterId;
  double PromotionComm;
  String CreateTime;
  String ImageUrl;
  bool IsMember;
  double Discount;
  bool IsExpert;
  String LastLoginTime;
  factory LoginDataUser.fromJson(Map<String, dynamic> json)=>_$LoginDataUserFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataUserToJson(this);
}

@JsonSerializable()
class LoginDataTicket{
  LoginDataTicket(this.Token,this.ExpireIn,this.GrantTime);
  String Token;
  String GrantTime;
  String ExpireIn;
  factory LoginDataTicket.fromJson(Map<String, dynamic> json)=>_$LoginDataTicketFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataTicketToJson(this);
}



Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
      json['Data'] == null
          ? null
          : LoginData.fromJson(json['Data'] as Map<String, dynamic>),
      json['Code'] as int,
      json['Message'] as String);
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
  'Code': instance.Code,
  'Message': instance.Message,
  'Data': instance.Data
};


Map<String, dynamic> _$LoginDataToJson(LoginData instance) =>
    <String, dynamic>{'User': instance.User, 'Ticket': instance.Ticket};


LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return LoginData(
      json['Ticket'] == null
          ? null
          : LoginDataTicket.fromJson(json['Ticket'] as Map<String, dynamic>),
      json['User'] == null
          ? null
          : LoginDataUser.fromJson(json['User'] as Map<String, dynamic>));
}

LoginDataUser _$LoginDataUserFromJson(Map<String, dynamic> json) {
  return LoginDataUser(
      json['UserId'] as int,
      json['UserName'] as String,
      json['Status'] as int,
      json['Mobile'] as String,
      json['Gender'] as String,
      json['UserPassword'] as String,
      json['IDCard'] as String,
      json['RealName'] as String,
      (json['Balance'] as num)?.toDouble(),
      (json['RechargeAmount'] as num)?.toDouble(),
      (json['WithdrawalAmount'] as num)?.toDouble(),
      (json['WalletBalance'] as num)?.toDouble(),
      json['WithdrawalsPassword'] as String,
      (json['PromoterId'] as num)?.toInt(),
      (json['PromotionComm'] as num)?.toDouble(),
      json['CreateTime'] as String,
      json['ImageUrl'] as String,
      json['IsMember'] as bool,
      (json['Discount'] as num)?.toDouble(),
      json['IsExpert'] as bool,
      json['LastLoginTime'] as String
  );
}


Map<String, dynamic> _$LoginDataUserToJson(LoginDataUser instance) =>
    <String, dynamic>{
      'UserId': instance.UserId,
      'UserName': instance.UserName,
      'Status': instance.Status,
      'Mobile': instance.Mobile,
      'Gender': instance.Gender,
      'UserPassword': instance.UserPassword,
      'IDCard': instance.IDCard,
      'RealName': instance.RealName,
      'Balance': instance.Balance,
      'RechargeAmount': instance.RechargeAmount,
      'WithdrawalAmount': instance.WithdrawalAmount,
      'WithdrawalsPassword': instance.WithdrawalsPassword,
      'PromoterId': instance.PromoterId,
      'PromotionComm': instance.PromotionComm,
      'CreateTime': instance.CreateTime,
      'ImageUrl': instance.ImageUrl,
      'IsMember': instance.IsMember,
      'Discount': instance.Discount,
      'IsExpert': instance.IsExpert,
      'LastLoginTime': instance.LastLoginTime,
    };

LoginDataTicket _$LoginDataTicketFromJson(Map<String, dynamic> json) {
  return LoginDataTicket(json['Token'] as String, json['ExpireIn'] as String,
      json['GrantTime'] as String);
}

Map<String, dynamic> _$LoginDataTicketToJson(LoginDataTicket instance) =>
    <String, dynamic>{
      'Token': instance.Token,
      'GrantTime': instance.GrantTime,
      'ExpireIn': instance.ExpireIn
    };