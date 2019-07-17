import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:qicaihongdemo/user_center/login.dart';
import 'my_data.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

class Setting extends StatefulWidget{
  _SettingState createState()=>new _SettingState();
}

class _SettingState extends State<Setting>{
  String Token="";

  @override
  void initState() {
    getToken();
    super.initState();
  }

  getToken() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    Token=prefs.getString('Token');
    if(Token==null){
      Token=="";
    }
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 1.0,
        title:new Text('通用设置',style: TextStyle(color: Colors.white,fontSize: 17.0),) ,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          _cell('个人资料设置',1,Token==""||Token==null?true:false),
          _bottomLine(),
          _cell('关于彩虹',2,false),
          Container(
            margin:EdgeInsets.only(top: 10.0) ,
          ),
          _cell('清理缓存',3,false),
          _bottomLine(),
          _cell('联系我们',4,false),
          _logoutButton(Token==""||Token==null?true:false)
        ],
      ),
    );
  }


  Widget _logoutButton(bool visible){
    return Offstage(
      offstage: visible,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        width: 350.0,
        child: RaisedButton(
          color: Colors.red,
          elevation: 1.0,
          onPressed:(){
            _logout();
          },
          child: Text('退出登录',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }



  Widget _cell( String title,int num,bool visible){
    return Offstage(
      offstage: visible,
      child: GestureDetector(
        onTap: (){
          if(num==1){
            Navigator.push(context, new CupertinoPageRoute(builder: (context)=>MyData()));
          }
          if(num==3){
            _clearCache();
          }
          if(num==4){
            _bottomSheet();
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
                        child: new Container(
                          margin: new EdgeInsets.only(left: 15.0),
                          child: new Text(title, style: TextStyle(color: Color(0xFF777777), fontSize: 16.0)),
                        ),
                      ),
                    ),
                    new Container(
                      child: new Icon(Icons.keyboard_arrow_right, color: Color(0xFF777777)),
                    ),
                  ],
                ),
              )
            ],
          ),
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

  _logout() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
      HttpResult resultData=await HttpUtil().post(USER_LOGOUT_URL);
      if(resultData.result){
        prefs.remove('Token');
        prefs.remove('UserId');
        prefs.remove('UserName');
        prefs.remove('Mobile');
        prefs.remove('ImageUrl');
        Navigator.pop(context);
      }else{
        prefs.remove('Token');
        prefs.remove('UserId');
        prefs.remove('UserName');
        prefs.remove('Mobile');
        prefs.remove('ImageUrl');
        Navigator.push(context, new CupertinoPageRoute(builder: (context)=>new LoginPage()));
        //throw Exception(resultData.data);
      }
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
                  child: Text("联系我们",style:TextStyle(color: Colors.black45,fontSize: 14.0),),
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



  void _clearCache() async {
    //此处展示加载loading
    try {
      Directory tempDir = await getTemporaryDirectory();
      //删除缓存目录
      await delDir(tempDir);
      await loadCache();
      Fluttertoast.showToast(
          msg: "清除缓存成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "清除缓存失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } finally {
      //此处隐藏加载loading
    }
  }
  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e) {
      print(e);
    }
  }

  ///加载缓存
  Future<Null> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
      print('临时目录大小: ' + value.toString());
      setState(() {
        //_cacheSizeStr = _renderSize(value);
      });
    } catch (err) {
      print(err);
    }
  }
  /// 递归方式 计算文件的大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        if (children != null)
          for (final FileSystemEntity child in children)
            total += await _getTotalSizeOfFilesInDir(child);
        return total;
      }
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }




}