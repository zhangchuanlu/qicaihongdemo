import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qicaihongdemo/model/user_model.dart' as Model;
import 'package:qicaihongdemo/util/service.dart';
import 'package:qicaihongdemo/model/user.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'set_nickname.dart';
import 'package:qicaihongdemo/user_center/login.dart';
import 'update_password.dart';
import 'update_useravatar.dart';
import 'package:qicaihongdemo/navigator/constants.dart';
import 'package:qicaihongdemo/events/login_event.dart';
import 'package:flutter/cupertino.dart';

class MyData extends StatefulWidget{
  _MyDataState createState()=>new _MyDataState();
}

class _MyDataState extends State<MyData> {
  String token="";
  String imgsrc='';
  String userName="";
  String gender="";
  String mobile="";
  @override
  void initState() {
    // TODO: implement initState
    _getUser();
    super.initState();
    Constants.eventBus.on<LoginEvent>().listen((event) {
      setState(() {
        print('****************************得到已经登陆的消息');
        _getUser();
      });
    });
  }




   _getUser()async{
    HttpResult resultData=await HttpUtil().post(USER_INFO_URL,context: context);
    if(resultData.result){
      User user=User.fromJson(resultData.data);
      setState(() {
        if(user.data.imageUrl!=null){
          imgsrc=user.data.imageUrl;
        }
        if(user.data.userName!=null){
          userName=user.data.userName;
        }
        if(user.data.gender!=null){
          gender=user.data.gender;
        }
        if(user.data.mobile!=null){
          mobile=user.data.mobile;
        }
      });
    }else{
      //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new LoginPage()));
      throw Exception(resultData.data);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: Colors.red,
        elevation: 1.0,
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
      onTap: () {
        Navigator.push(context, new CupertinoPageRoute(builder: (context)=>new UserAvatar(img: imgsrc,))).then((data){
            _getUser();
        });
    },
      child: new Container(
        color: Colors.white,
        height:80.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
                margin: new EdgeInsets.all(0.0),
                height:80.0,
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              margin: new EdgeInsets.only(left: 15.0),
                              child: new Text("头像", style: TextStyle(color: Color(0xFF777777), fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Container(
                                child: ClipOval(
                                  child: new Image.network(imgsrc,width:70.0,height:70.0,fit: BoxFit.fitWidth,),
                                )
                            ),
                            new Icon(Icons.keyboard_arrow_right, color: Color(0xFF777777)),
                          ],
                        ),
                      ),
                    ]
                )
            ),
          ],
        ),
      ),
    ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
          ),
          _cell( "昵称", userName,'setnickname'),
          _bottomLine(),
          _cell( "性别",gender,'setgender'),
          Container(
            margin: EdgeInsets.only(top: 10.0),
          ),
          _cell( "修改密码", "",'updatepassword'),
          _bottomLine(),
          _cell( "手机号码", mobile,''),
        ],
      ),
    );
  }


  _save(String six)async{
    var data={
      "gender": six
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    HttpResult resultData=await HttpUtil().post(USER_GENDER_URL,params: data);
    if(resultData.result){
      gender=six;
      _getUser();
     Navigator.pop(context);
    }else{
      _getUser();
      Navigator.pop(context);
      throw Exception(resultData.data);
    }
  }





  Widget _cell( String title, String describe,String function,) {
    return GestureDetector(
      onTap: () {
        switch(function){
          case "setnickname":
            {
              Navigator.push(context, new CupertinoPageRoute(builder: (context)=>new SetNickName(title: userName,))).then((data){
                if (data != null) {
                  _getUser();
                }
              });
            }
            break;
          case "setgender":
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                  return new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        title: Center(
                            child: Text("设置性别",style:TextStyle(color: Colors.black45,fontSize: 14.0),),
                          ),
                      ),
                      Divider(height:1.0,indent:0.0,color: Colors.grey,),
                      new ListTile(
                        title: Center(
                          child: Text("男",style:TextStyle(color: Colors.blue,fontSize: 16.0),),
                        ),
                        onTap: () async {
                          _save("男");
                        },
                      ),
                      Divider(height:1.0,indent:0.0,color: Colors.grey,),
                      new ListTile(
                        title: Center(
                          child: Text("女",style:TextStyle(color: Colors.blue,fontSize: 16.0),),
                        ),
                        onTap: () async {
                          _save("女");
                        },
                      ),
                      Divider(height:1.0,indent:0.0,color: Colors.grey,),
                      new ListTile(
                        title: Center(
                          child: Text("取消",style:TextStyle(color: Colors.blue,fontSize: 14.0),),
                        ),
                        onTap: ()async{
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                }
            );
            break;
          case "updatepassword":
            Navigator.push(context, new CupertinoPageRoute(builder: (context)=>UpdatePassword()));
            break;
        }
      },
      child: new Container(
        color: Colors.white,
        height:50.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
                margin: new EdgeInsets.all(0.0),
                height:50.0,
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              margin: new EdgeInsets.only(left: 15.0),
                              child: new Text(title, style: TextStyle(color: Color(0xFF777777), fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Text(describe, style: TextStyle(color: Colors.black54, fontSize: 16.0)),
                            new Icon(Icons.keyboard_arrow_right, color: Color(0xFF777777)),
                          ],
                        ),
                      ),
                    ]
                )
            ),


          ],
        ),
      ),
    );
  }

  Widget _bottomLine() {

      return new Container(
          margin: new EdgeInsets.all(0.0),
          child: new Divider(
              height: 1.0,
              color: Colors.grey
          ),
          padding: EdgeInsets.only(left: 15.0, right: 15.0)
      );

  }


}