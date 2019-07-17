import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyOrder extends StatefulWidget{
  _MyOrderState createState()=>new _MyOrderState();
}

class _MyOrderState extends State<MyOrder>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的订单"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: (){
          Navigator.pop(context);
        }),
        elevation: 1.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: CupertinoSegmentedControl<int>(
              children: {
                1:Padding(padding: EdgeInsets.all(5.0),child: Text("全部"),),
                2:Padding(padding: EdgeInsets.all(5.0),child: Text("已支付"),),
                3:Padding(padding: EdgeInsets.all(5.0),child: Text("待支付"),),
              },
              onValueChanged: (value){
                print("the value changed ! $value");
              },
              unselectedColor: Colors.white,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem()
              ],
            ),
          )
        ],
      )

    );
  }

  Widget ListItem(){
    return Column(
      children: <Widget>[
        Divider(height: 1.0,indent: 1.0,color: Colors.grey,),
        new Container(
          margin: EdgeInsets.only(bottom: 10.0,top: 10.0,left: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text("下单时间：1天前"),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Text("未支付"),
              )
            ],
          ),
        ),

        Divider(height: 1.0,indent: 1.0,color: Colors.grey,),
        new Container(
          height: 60.0,
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.only(left: 10.0),
                    child: ClipOval(
                      child: new Image.asset('assets/images/china.jpg',width: 50.0, height: 50.0,fit: BoxFit.fitWidth,),
                    )
                ),
                new Container(
                    margin: new EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("90分钟足球", style: TextStyle( fontSize: 15.0), textAlign: TextAlign.left),
                        new Text("篮球评论员", style: TextStyle(color: Color(0xFF555555), fontSize: 12.0), textAlign: TextAlign.left)
                      ],
                    )
                )
              ]
          ),
        ),
        new Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 10.0),
          child: new Text("周五001 日职 川崎前锋VS名古屋鲸八",textAlign: TextAlign.left,),
        ),
        new Container(
          margin: EdgeInsets.all(10.0),
          height: 30.0,
          color: Colors.white12,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0),
                alignment: Alignment.center,
                height: 20.0,
                width: 30,
                child: Text("竞足",style: TextStyle(color: Colors.blue, fontSize: 12.0),),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(3.0)),
              ),
              Expanded(
                child: Text("05/17 日职|川崎前锋VS名古屋鲸八",style: TextStyle(fontSize: 12.0)),
              ),
              new Container(
                child: new Icon(Icons.navigate_next, color: Color(0xFF777777)),
              ),
            ],
          ),
        ),
        new Container(
          margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text("1天前"),
              ),
              Container(
                child: Text("￥38.00",style: TextStyle(color: Colors.orange),),
              )
            ],
          ),
        ),
        Divider(height: 1.0,indent: 1.0,color: Colors.grey,),
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: FlatButton(
            onPressed: (){

            },
            child: Text("立即支付",style: TextStyle(color: Colors.white,),),
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          alignment: Alignment.topRight,
        )
      ],
    );
  }

}