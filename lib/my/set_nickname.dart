import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:qicaihongdemo/user_center/login.dart';

class SetNickName extends StatefulWidget{

  SetNickName({Key key, this.title}) : super(key: key);
  final String title;
  _SetNickNameState createState()=>new _SetNickNameState();
}

class _SetNickNameState extends State<SetNickName>{
  var _nicknameController=new TextEditingController();

  @override
  void initState() {

    _nicknameController.text=widget.title;
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("设置昵称"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
//          Navigator.pop(context);
        Navigator.pop(context);
        }),
        actions: <Widget>[
          FlatButton(
            child: new Text("保存",style: TextStyle(color: Colors.white),),
            onPressed: (){
              var data={
                "nickname": _nicknameController.text
              };
              _save(data);
            },
          )
        ],
        elevation: 1.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0,left: 10.0,bottom: 10.0),
            child: Text('昵称'),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,

            ),
            controller: _nicknameController,
          )
        ],
      ),
    );
  }


  _save(Object data)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    HttpResult resultData=await HttpUtil().post(USER_NICKNAME_URL,params: data);
    if(resultData.result){
      prefs.setString('UserName',_nicknameController.text );
      Navigator.of(context).pop(_nicknameController.text);
    }else{
      Navigator.of(context).pop();
      throw Exception(resultData.data);
    }
  }

}