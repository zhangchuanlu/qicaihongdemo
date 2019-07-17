import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qicaihongdemo/user_center/login.dart';
import 'package:qicaihongdemo/my/setting_page.dart';
import 'package:qicaihongdemo/my/feedback.dart';
import 'package:url_launcher/url_launcher.dart';
import 'my_order.dart';
import 'my_collect.dart';
import 'activity.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:qicaihongdemo/model/user.dart';
import 'package:flutter/cupertino.dart';

class My extends StatefulWidget{
  @override
  _MyState createState()=> _MyState();
}

class _MyState extends State<My>{
  String userName="";
  String Token="";
  String Mobile="";
  String imgsrc="";
  Widget img ;
  bool visible=false;
  _getUser() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    HttpResult resultData=await HttpUtil().post(USER_INFO_URL);
    if(resultData.result){
      User user=User.fromJson(resultData.data);
      setState(() {
        Token=prefs.getString("Token");
        if(user.data.imageUrl!=null){
          imgsrc=user.data.imageUrl;
        }
        if(user.data.userName!=null){
          userName=user.data.userName;
        }
        if(user.data.mobile!=null) {
          Mobile = user.data.mobile;
          visible=false;
        }
      });
    }else{
      setState(() {
        userName="立即登录";
        Mobile="";
        imgsrc="";
        Token="";
        prefs.remove("Token");
        visible=true;
      });
    }

  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _getUser();
    if (!mounted) {
      return;
    }
  }



  @override
  Widget build(BuildContext context){
    if(imgsrc==null||imgsrc==""){
      img=Image.asset("assets/images/china.jpg",width: 70.0, height: 70.0,fit: BoxFit.fitWidth,);
    }else{
      img=Image.network(imgsrc,width: 70.0, height: 70.0,fit: BoxFit.fitWidth,);
    }


    return Scaffold(
        body: Column(
          children: <Widget>[

            GestureDetector(
              onTap: () {
                if(Token==""||Token==null){
                  Navigator.push(context, new CupertinoPageRoute(
                      builder:(context)=>new LoginPage()
                  )).then((data){
                    _getUser();
                  });
                }else{
                  print(Token);
                }
              },
              child:new Container(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                height:250.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      alignment: Alignment.center,
                      margin: new EdgeInsets.only( top: 10.0),
                      child: new IconButton(
                        iconSize: 20.0,
                        icon: new Icon(Icons.settings, color: Colors.black),
                          onPressed: () {
                            Navigator.push(context, new CupertinoPageRoute(builder: (context)=>new Setting())).then((data){
                              _getUser();
                            });
                          },
                      ),
                    ),
                    new Container(
                      height: 90.0,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                                padding: new EdgeInsets.only(left: 15.0),
                                child: ClipOval(
                                  child:img
                                )
                            ),
                            new Container(
                                margin: new EdgeInsets.only(left: 15.0,),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: new Text(userName, style: TextStyle(color: Color(0xFF777777), fontSize: 18.0), textAlign: TextAlign.left),
                                    ),
                                    Offstage(
                                      offstage:visible ,
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        child: new Text(Mobile, style: TextStyle(color: Color(0xFF555555), fontSize: 12.0), textAlign: TextAlign.left),
                                      ),
                                    ),
                                  ],
                                )
                            )
                          ]
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 20.0,right: 20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildButtonColumn( context,Icons.description, '我的订单',1),
                          _buildButtonColumn( context, Icons.star, '我的收藏',2),
                          _buildButtonColumn( context,Icons.assistant_photo, '活动专区',3),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                    )
                  ],
                ),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(""),
                      //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
                      centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                    ),
                  )

              ) ,
            ),

            _cell( Icons.border_color, "意见反馈","feedback"),
            _bottomLine(),
            _cell( Icons.help, "帮助中心",""),
            _bottomLine(),
            _cell( Icons.textsms, "专属客服","call")
          ],
        )
    );
  }


  Widget _buildButtonColumn(BuildContext context, IconData src, String label,int num) {

    return GestureDetector(
      onTap: () {
        if(Token==null||Token==""){
          Navigator.push(context, new CupertinoPageRoute(
              builder:(context)=>new LoginPage()
          )).then((data){
            _getUser();
          });
        }else{
          if(num==1){
            Navigator.push(context, new CupertinoPageRoute(builder: (context)=>MyOrder()));
          }
          if(num==2){
            Navigator.push(context, new CupertinoPageRoute(builder: (context)=>MyCollect()));
          }
          if(num==3){
            Navigator.push(context, new CupertinoPageRoute(builder: (context)=>Activity()));
          }
        }
      },

      child: Container(
        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // 沿着 main axis 居中放置
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Icon(src,size: 40.0,color: Colors.red,),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF777777),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }

  Widget _cell( IconData iconData, String title,String function){
    return GestureDetector(
      onTap: (){
        switch(function){
          case "feedback":
            Navigator.push(context, new CupertinoPageRoute(builder: (context)=>FeedBack()));
            break;
          case "call":
            _bottomSheet();
            break;
        }

      },
      child: new Container(
        color:Colors.white,
        height: 50.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(0.0),
              height: ( 50.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      margin: new EdgeInsets.only(left: 15.0),
                      child: new Row(
                        children: <Widget>[
                          new Icon(iconData, color: Colors.red),
                          new Container(
                            margin: new EdgeInsets.only(left: 15.0),
                            child: new Text(title, style: TextStyle(color: Color(0xFF777777), fontSize: 16.0)),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    child: new Icon(Icons.arrow_forward, color: Color(0xFF777777)),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomLine() {
      return new Container(
          child: new Divider(
              height: 1.0,
              color: Colors.grey
          ),
          padding: EdgeInsets.only(left: 15.0, right: 15.0)
      );
  }


  Widget _bottomSheet(){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              title: Center(
                child: Text("在线客服",style:TextStyle(color: Colors.black45,fontSize: 14.0),),
              ),
            ),
            Divider(height:1.0,indent:0.0,color: Colors.grey,),
            new ListTile(
              title: Center(
                child: Text("15912345678",style:TextStyle(color: Colors.red,fontSize: 16.0),),
              ),
              onTap: () async {
                _launchPhone();
              },
            ),
            Divider(height:1.0,indent:0.0,color: Colors.grey,),
            new ListTile(
              title: Center(
                child: Text("取消",style:TextStyle(color: Colors.blue,fontSize: 16.0),),
              ),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

  _launchPhone() async {
    const url = 'tel:15912345678';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


