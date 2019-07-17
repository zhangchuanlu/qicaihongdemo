import 'package:flutter/material.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qicaihongdemo/model/user_model.dart' as Model;
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';


class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  var _userPassController=new TextEditingController();
  var _userNameController=new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false, //输入框抵住键盘
      appBar: AppBar(
        title:new Text('登录',style: TextStyle(color: Colors.black,fontSize: 17.0),) ,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading:new IconButton(
            icon:new Icon(Icons.close,color: Colors.grey,),
            onPressed:(){
              Navigator.pop(context);
            }
        ),
        elevation: 1.0,
        actions: <Widget>[
          FlatButton(
            child: Text('注册'),
            onPressed: (){
              Navigator.push(context, new CupertinoPageRoute(builder: (context)=>Register()));
            },
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Padding(
            child: Image.asset('assets/images/china.jpg',width: 100.0,height: 100.0,),
            padding: EdgeInsets.all(10.0),
          ),
          new Padding(
            child: new TextField(
              controller: _userNameController,
              decoration: new InputDecoration(hintText: '请输入用户名',prefixIcon:new Icon(Icons.phone_android)),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          new Padding(
            child: new TextField(
              controller: _userPassController,
              decoration:  new InputDecoration(hintText: '请输入密码',prefixIcon:new Icon(Icons.lock)),
              obscureText: true,
            ),
            padding: EdgeInsets.all(10.0),
          ),
          new Padding(
            child: FlatButton(
              onPressed: (){
                //登录参数
                var data={
                  "UserName": _userNameController.text,
                  "Password":_userPassController.text ,
                  "AppVersion": "string",
                  "UUID": "string",
                };
                _login(data);
              },
              child: Text("登录",style: TextStyle(color: Colors.white,),),
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

     _login(Object data)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    HttpResult resultData=await HttpUtil().post(USER_LOGIN_URL,data: data);
    if(resultData.result){
      Model.Login model=Model.Login.fromJson(resultData.data);
        prefs.setString('Token', model.Data.Ticket.Token);
        prefs.setInt('UserId', model.Data.User.UserId);
        prefs.setString('UserName', model.Data.User.UserName);
        prefs.setString('Mobile', model.Data.User.Mobile);
        prefs.setString('ImageUrl', model.Data.User.ImageUrl);
        Navigator.pop(context,'refresh');
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
