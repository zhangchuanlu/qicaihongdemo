import 'package:flutter/material.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/util/service.dart';


class UpdatePassword extends StatefulWidget{
  _UpdatePasswordState createState()=>new _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword>{
  var _oldPasswordController=new TextEditingController();
  var _newPasswordController=new TextEditingController();
  var _newPasswordController2=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改密码"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: (){
          Navigator.pop(context);
        }),
        elevation: 1.0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0,right: 10.0),
        child: Column(
          children: <Widget>[
            new Padding(
              child: new TextField(
                controller: _oldPasswordController,
                decoration: new InputDecoration(labelText: '旧密码',),
                obscureText: true,
              ),
              padding: EdgeInsets.all(10.0),
            ),
            new Padding(
              child: new TextField(
                controller: _newPasswordController,
                decoration: new InputDecoration(labelText: '新密码',),
                obscureText: true,
              ),
              padding: EdgeInsets.all(10.0),
            ),
            new Padding(
              child: new TextField(
                controller: _newPasswordController2,
                decoration: new InputDecoration(labelText: '确认密码',),
                obscureText: true,
              ),
              padding: EdgeInsets.all(10.0),
            ),
            new Padding(
              child: FlatButton(
                onPressed: (){
                  var data={
                    "OldPassword": _oldPasswordController.text,
                    "NewPassword":_newPasswordController.text
                  };
                  _updatePassword(data);
                },
                child: Text("修改密码",style: TextStyle(color: Colors.white,),),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: EdgeInsets.only(left: 120.0,right: 120.0),
              ),
              padding: EdgeInsets.all(10.0),
            )
          ],
        ),
      ),
    );
  }

  _updatePassword(Object data) async {
    if (_newPasswordController.text != _newPasswordController2.text) {
      Fluttertoast.showToast(
          msg: "两次密码不一致！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return;
    }
    HttpResult resultData = await HttpUtil().post(
        USER_UPDATEPASSWORD_URL, data: data);
    print(resultData.result);
    if (resultData.result == true) {
      Fluttertoast.showToast(
          msg: "修改成功!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      _newPasswordController.text = "";
      _newPasswordController2.text = "";
      _oldPasswordController.text = "";
      Navigator.pop(context);
    } else {
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