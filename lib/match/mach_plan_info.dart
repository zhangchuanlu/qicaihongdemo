import 'package:flutter/material.dart';

class MachPlanInfo extends StatefulWidget{
  _MachPlanInfoState createState()=>new _MachPlanInfoState();
}

class _MachPlanInfoState extends State<MachPlanInfo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("方案详情"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: (){
          Navigator.pop(context);
        }),
        elevation: 1.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.star_border),onPressed: (){
            print("收藏");
          },)
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0,right: 10.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 20,
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text("方案售卖倒计时 00:28:10",style: TextStyle(fontSize: 12.0,color: Colors.blue),),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text("今天只有一单，注意开赛时间！上车的抓紧，明天一起收米！",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("2小时前",style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                  ),
                  Container(
                    child: Icon(Icons.remove_red_eye,color: Colors.grey,size: 12.0,),
                  ),
                  Container(
                    child: Text("376人",style: TextStyle(fontSize: 12.0,color: Colors.red),),
                  ),
                  Container(
                    child: Text("查看",style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                  )
                ],
              ),
            ),
            Divider(height: 1.0,indent: 1.0,color: Colors.grey,),
            Container(
              padding: new EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(

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
                              new Text("合纵连横", style: TextStyle( fontSize: 15.0,fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                              new Text("足球评论员、资深媒体人", style: TextStyle(color: Color(0xFF555555), fontSize: 12.0), textAlign: TextAlign.left)
                            ],
                          )
                      ),
                    ),
                    GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 24,
                          child: Text("+关注",style: TextStyle(fontSize: 12.0,color: Colors.white),),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15.0)),
                        )
                    )
                  ]
              ),
            ),

            Divider(height: 1,indent: 1.0,color: Colors.grey,),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text("[竞足]西甲|2019-05-18 10:15",style: TextStyle(color: Colors.grey,fontSize: 12.0),),
            ),
            Container(
              child: Row(
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
                          child: Image.asset("assets/images/china.jpg",width: 40.0, height: 40.0,fit: BoxFit.fitWidth,),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "巴塞罗那",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("未开始",style: TextStyle(color: Colors.blue,fontSize: 12.0),),
                        Text("VS",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
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
                          child: Image.asset("assets/images/china.jpg",width: 40.0, height: 40.0,fit: BoxFit.fitWidth,),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "巴塞罗那",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _ListPlan(1,2.97,3.50,1.87),
            _ListPlan(0,7.35,4.75,1.23),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.error,color: Colors.grey,size: 12.0),
                  Text("观点仅供参考，投注需谨慎，如需要购彩请前往彩票店",style: TextStyle(color: Colors.grey,fontSize: 12.0),)
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                alignment: Alignment.centerLeft,
                height: 50.0,
                color: Colors.black12,
                child: Text("需要支付：￥58.00"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50.0,
              width: 90,
              color: Colors.red,
              child: Text("立即购买",style: TextStyle(color: Colors.white),),
            )
          ],
        )
      ),
    );
  }

  Widget _Square(double probability,String title){
    return Container(
      alignment: Alignment.center,
      width: 90.0,
      height: 50.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title),
          Text(probability.toString())
        ],
      ),
      decoration: BoxDecoration(
        border: new Border.all(color: Colors.grey, width: 0.5),
      ),
    );
  }

  Widget _ListPlan(int ball,double host,double draw,double visiting){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Column(
              children: <Widget>[
                Text("让球"),
                Text(ball.toString())
              ],
            ),
          ),
          _Square(host,"主胜"),
          _Square(draw,"平"),
          _Square(visiting,"客胜"),
        ],
      ),
    );
  }

}