import 'package:flutter/material.dart';

class Activity extends StatefulWidget{
  _ActivityState createState()=>new _ActivityState();
}

class _ActivityState extends State<Activity>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("活动广场"),
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/china.jpg",width: 200.0,height: 200.0,),
          ),
          new Container(
            child: Text("没有新的活动哦",style: TextStyle(color: Colors.grey),),
          )
        ],
      ),
    );
  }
}