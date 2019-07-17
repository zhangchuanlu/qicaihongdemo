import 'package:flutter/material.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qicaihongdemo/user_center/login.dart';

class FeedBack extends StatefulWidget{
  @override
  _FeedBackState createState()=>new _FeedBackState();
}

var loginState;



class _FeedBackState extends State<FeedBack>{
  var _feedbackController=new TextEditingController();
  var _emailController=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState'

    super.initState();
    _getToken();

  }
  Future _getToken() async{
    Future<dynamic> future = Future(()async{
      SharedPreferences prefs =await SharedPreferences.getInstance();
      return prefs.getString("Token");
    });
    future.then((val){
      if(val == null){
        setState(() {
          loginState = 0;
        });
      }else{
        setState(() {
          loginState = 1;
        });
      }
    }).catchError((_){
      print("catchError");
    });

  }


  @override
  Widget build(BuildContext context) {

    if(loginState == 0){
      return LoginPage();
    }

    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: (){
          Navigator.pop(context);
        }),
        title: new Text("意见反馈"),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 1.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0,left: 10.0,bottom: 10.0),
            child: Text('问题和意见'),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              hintText: "请详情描述你的问题和意见",

            ),
            controller: _feedbackController,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0,left: 10.0,bottom: 10.0),
            child: Text('QQ/邮箱'),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                hintText: "（选填，方便我们联系你）"
            ),
            controller: _emailController,
          ),
          Center(
            child: FlatButton(
              onPressed: (){
                var data={
                  "Content": _feedbackController.text,
                  "Contact":_emailController.text ,
                };
                _save(data);
                Navigator.pop(context);
              },
              child: Text("提交",style: TextStyle(color: Colors.white,),),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              padding: EdgeInsets.only(left: 140.0,right: 140.0),
            ),
          )


        ]
      ),
    );
  }

  _save(Object data)async{
    HttpResult resultData=await HttpUtil().post(USER_FEEDBACK_URL,data: data,context: context);
    if(resultData.result){
      Navigator.pop(context);
    }else{
      throw Exception(resultData.data);
    }

  }


}