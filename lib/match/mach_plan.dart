import 'package:flutter/material.dart';
import 'mach_plan_info.dart';
import 'package:flutter/cupertino.dart';

class MachPlan extends StatefulWidget{
  _MachPlanState createState()=>new _MachPlanState();
}

class _MachPlanState extends State<MachPlan>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                        child: IconButton(
                          icon: Icon(Icons.navigate_before),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("[竞足]西甲"),
                        ),
                      ),
                      GestureDetector(
                        child:  Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.0),
                          height: 25.0,
                          width: 50,
                          child: Text("+关注",),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(3.0)),
                        ),
                        onTap: (){
                          print("关注");
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: <Widget>[
                      Text("05/18 22:15"),
                      Text("未开始",style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // 沿着 main axis 居中放置
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            ClipOval(
                              child: Image.asset("assets/images/china.jpg",width: 70.0, height: 70.0,fit: BoxFit.fitWidth,),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "巴塞罗那",
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
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text("VS",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                            Container(
                              alignment: Alignment.center,
                              width: 70,
                              height: 20,
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text("2个方案",style: TextStyle(fontSize: 12.0,color: Colors.white),),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 1.0),
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(10.0)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // 沿着 main axis 居中放置
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            ClipOval(
                              child: Image.asset("assets/images/china.jpg",width: 70.0, height: 70.0,fit: BoxFit.fitWidth,),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "巴塞罗那",
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
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
//                image: new DecorationImage(
//                  image: AssetImage("assets/images/china.jpg"),
//                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//                ),///背景图
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Plan(),
                  Plan(),
                  Plan(),
                  Plan(),
                  Plan(),
                  Plan(),
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Widget Plan(){
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Divider(height: 1.0,indent: 1.0,color: Colors.grey,),
            new Container(
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        padding: new EdgeInsets.only(left: 10.0),
                        child: ClipOval(
                          child: new Image.asset('assets/images/china.jpg',width: 50.0, height: 50.0,fit: BoxFit.fitWidth,),
                        )
                    ),
                    new Expanded(
                      child: Container(
                          margin: new EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    new Text("合纵连横", style: TextStyle( fontSize: 15.0), textAlign: TextAlign.left),
                                    Container(
                                      margin: EdgeInsets.only(left: 5.0),
                                      padding: EdgeInsets.only(left: 5.0,right:  5.0),
                                      alignment: Alignment.center,
                                      child: Text("英超、西甲",style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12.0),),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.deepOrangeAccent, width: 1.0),
                                          borderRadius: BorderRadius.circular(3.0)),
                                    ),
                                  ],
                                ),
                              ),
                              new Text("足球评论员、资深媒体人", style: TextStyle(color: Color(0xFF555555), fontSize: 12.0), textAlign: TextAlign.left)
                            ],
                          )
                      ),
                    ),
                    new Container(
                      margin: new EdgeInsets.only( right: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("82",style: TextStyle(color: Colors.red,fontSize: 20),),
                              Text("%",style: TextStyle(color: Colors.red,fontSize: 10),)
                            ],
                          ),
                          Text("命中率",style: TextStyle(color: Colors.red,fontSize: 10.0),)
                        ],
                      ),
                    )
                  ]
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              child: Text("今天只有一单，注意开赛时间！上车的抓紧，明天一起收米",style: TextStyle(fontSize: 16),),
            ),
            new Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("2小时前",style: TextStyle(color: Colors.grey),),
                  ),
                  Container(
                    child: Text("￥58.00",style: TextStyle(color: Colors.orange),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, new CupertinoPageRoute(builder: (context)=>MachPlanInfo()));
      },
    );
  }
}