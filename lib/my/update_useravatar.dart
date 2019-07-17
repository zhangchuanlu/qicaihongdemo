import 'package:flutter/material.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:qicaihongdemo/model/avatar_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAvatar extends StatefulWidget{
  UserAvatar({Key key, this.img}) : super(key: key);
  final String img;
  _UserAvatarState createState()=>new _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar>{
  List<String> imgList=new List<String>();
  String avatar="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      avatar=widget.img;
    });
    getavatar();
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = List<Widget>();

    for(String src in imgList){
      tiles.add(
          Img(src)
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("头像信息"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: (){
          print('11');
          Navigator.pop(context);
        }),
        elevation: 1.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 350,
              child: Image.network(avatar),
              decoration: BoxDecoration(
                border: new Border.all(color: Colors.yellow, width: 1),
              ),
            ),
            OutlineButton(
              child: Text("确认"),
              onPressed: (){
                save();
              },
            )
          ],
        )
      ),
      bottomNavigationBar: Container(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: tiles,
          )
      ),
    );
  }


  Widget Img(String src){
    return GestureDetector(
      child: Container(
        child:Image.network(src) ,
        decoration: BoxDecoration(
          border: new Border.all(color: Colors.grey, width: 1),
        ),
      ),
      onTap: (){
        setState(() {
          avatar=src;
          print(avatar);
        });
      },
    );
  }

  getavatar() async{
    HttpResult resultData=await HttpUtil().post(USER_GETAVATAR_URL);
    if(resultData.result){
      AvatarList list=AvatarList.fromJson(resultData.data);
      for(int i=0;i<list.data.length;i++){
        setState(() {
          imgList.add(list.data[i].avatarUrl);
        });
      }
    }
  }

  save() async{
    var data={
      "ImgUrl":avatar
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    HttpResult resultData=await HttpUtil().post(USER_UPDATEUSERIMGURL_URL,params: data);
    if(resultData.result){
      prefs.setString('ImageUrl', avatar);
      Navigator.pop(context);
    }else{
      Navigator.pop(context);
    }
  }

}