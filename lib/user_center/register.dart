import 'package:flutter/material.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qicaihongdemo/model/sms_vcode.dart' as Model;
import 'package:qicaihongdemo/util/regex_util.dart';
import 'dart:async';


class Register extends StatefulWidget{
  _RegisterState createState()=>new _RegisterState();
}

class _RegisterState extends State<Register>{
  var _phoneController=new TextEditingController();
  var _vcodeController=new TextEditingController();
  var _passwordController=new TextEditingController();
  var SMSVCodeToken;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, //输入框抵住键盘
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.navigate_before,color: Colors.grey,), onPressed: (){
          Navigator.pop(context);
        }),
        elevation: 1.0,
        backgroundColor: Colors.white,
      ),

      body:new Column(
        children: <Widget>[
          new Padding(
            child: Text("手机号注册",style: TextStyle(fontSize: 18.0 ),),
            padding: EdgeInsets.all(10.0),
          ),
          new Padding(
            child: new TextField(
              controller: _phoneController,
              decoration: new InputDecoration(hintText: '请输入手机号',prefixIcon:new Icon(Icons.phone_android)),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          new Padding(
            child: new TextField(
              controller: _vcodeController,
              decoration: new InputDecoration(hintText: '请输入验证码',prefixIcon: Icon(Icons.message),suffixIcon: VCode()),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          new Padding(
            child: new TextField(
              controller: _passwordController,
              decoration: new InputDecoration(hintText: '请输入密码',prefixIcon:new Icon(Icons.lock), suffixIcon: Icon(Icons.remove_red_eye)),
              obscureText: true,

            ),
            padding: EdgeInsets.all(10.0),
          ),
          new Padding(
            child: FlatButton(
              onPressed: (){
                var data={
                  "Mobile": _phoneController.text,
                  "Password":_passwordController.text,
                  "SMSValidateCode":{
                    "Token":SMSVCodeToken,
                    "Value":_vcodeController.text
                  }
                };
                _register(data);
              },
              child: Text("注册",style: TextStyle(color: Colors.white,),),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              padding: EdgeInsets.only(left: 140.0,right: 140.0),
            ),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );
  }


  String yzmText="获取验证码";
  Widget VCode() {
    return Container(
      child: OutlineButton	(
        child: Text(yzmText,style: TextStyle(color: Colors.grey),),
        onPressed: yzmText=="获取验证码"?yzmGet:null,
      ),
    );
  }
  Timer countDownTimer;
  yzmGet() {
    if(!RegexUtil.isMobileSimple(_phoneController.text)){
      Fluttertoast.showToast(
          msg: "请输入正确格式手机号码！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return ;
    }
    var data={
      "mobile": _phoneController.text,
      "description":"注册"
    };
    _GetSMSVCode(data);
    countDownTimer?.cancel();//如果已存在先取消置空
    countDownTimer = null;
    countDownTimer = new Timer.periodic(new Duration(seconds: 1), (t){
      setState(() {
        if(60-t.tick>0){//60-t.tick代表剩余秒数，如果大于0，设置yzmText为剩余秒数，否则重置yzmText，关闭countTimer
          yzmText = "${60-t.tick}秒";
        }else{
          yzmText = '获取验证码';
          countDownTimer.cancel();
          countDownTimer = null;
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    countDownTimer?.cancel();
    countDownTimer = null;
    super.dispose();

  }




  //发送验证码
  _GetSMSVCode(Object data) async{
    HttpResult resultData=await HttpUtil().post(COMMON_SMS_CREATE_URL,params: data);
    if(resultData.result){
      Model.SMSVCode model=Model.SMSVCode.fromJson(resultData.data);
      setState(() {
        SMSVCodeToken= model.data.token;
      });
      Fluttertoast.showToast(
          msg: "发送成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  //注册
  _register(Object data) async{
    if(_beforeRegister()==true){
      HttpResult resultData=await HttpUtil().post(USER_REGISTER_URL,data: data);
      if(resultData.result==true){
        Fluttertoast.showToast(
            msg:"注册成功!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        _phoneController.text="";
        _passwordController.text="";
        _vcodeController.text="";
        Navigator.pop(context);
      }else{
        Fluttertoast.showToast(
            msg: resultData.data,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }


  //注册验证
  bool _beforeRegister(){

    if(!RegexUtil.isMobileSimple(_phoneController.text)){
      Fluttertoast.showToast(
          msg: "请输入正确格式手机号码！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return  false;
    }

    if(_passwordController.text.length==0){
      Fluttertoast.showToast(
          msg: "请输入密码！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }


    if(_vcodeController.text.length==0){
      Fluttertoast.showToast(
          msg: "请输入短信验证码！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    return true;
  }

}