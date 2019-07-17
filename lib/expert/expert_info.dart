import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:qicaihongdemo/model/expert_model.dart';

class ExpertInfo extends StatefulWidget{
  ExpertInfo({Key key,this.Id}):super(key:key);
  final int Id;
  _ExpertInfoState createState()=>new _ExpertInfoState();
}




class _ExpertInfoState extends State<ExpertInfo>{


  Future getExpert() async{
    var param={
      "type":widget.Id
    };

    HttpResult resultData=await HttpUtil().post(EXPERT_INFO_URL,params:param,context: context);
    if(resultData.result){

    }else{
      throw Exception(resultData.data);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30.0),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.navigate_before,color: Colors.white,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                        child: ClipOval(
                          child: Image.asset("assets/images/china.jpg",width: 50.0, height: 50.0,fit: BoxFit.fitWidth,),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text("王也",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                                child: Text("足球评论员、资深媒体人",style: TextStyle(fontSize: 12.0,color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            alignment: Alignment.center,
                            width: 50,
                            height: 20,
                            child: Text("+关注",style: TextStyle(fontSize: 12.0,color: Colors.red),),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                          )
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0,bottom: 20.0),
                    child: Text("足球媒体人，从事媒体行业多年",style: TextStyle(fontSize: 12.0,color: Colors.white),),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 10.0,top: 20.0,bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Text("擅长联赛：",style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    padding: EdgeInsets.only(left: 5.0,right:  5.0),
                    alignment: Alignment.center,
                    child: Text("英超",style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12.0),),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrangeAccent, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    padding: EdgeInsets.only(left: 5.0,right:  5.0),
                    alignment: Alignment.center,
                    child: Text("西甲",style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12.0),),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrangeAccent, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),

                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 4,
                                height: 20,
                                color: Colors.deepOrange,
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text("最新方案（2）"),
                              ),
                            ],
                          ),
                        ),
                        cell(),
                        cell()
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 4,
                                height: 20,
                                color: Colors.deepOrange,
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text("最新方案（2）"),
                              ),
                            ],
                          ),
                        ),
                        cell(),
                        cell()
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      )
    );
  }

  Widget cell(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 1,indent: 1.0,color: Colors.grey,),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text("周六003 葡超 波尔图VS里斯本竞技"),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: 30.0,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  alignment: Alignment.center,
                  height: 20.0,
                  width: 30,
                  child: Text("竞足",style: TextStyle(color: Colors.blue, fontSize: 12.0),),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(3.0)),
                ),
                Expanded(
                  child: Text("05/19 葡超 | 波尔图VS里斯本竞技",style: TextStyle(color: Colors.grey),),
                ),
                Container(
                  child: Icon(Icons.navigate_next,color: Colors.grey),
                )

              ],
            ),
            color: Colors.black12,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text("3小时前",style: TextStyle(fontSize: 13.0,color: Colors.grey),),
                ),
                Text("￥38.00",style: TextStyle(color: Colors.orangeAccent),)
              ],
            ),
          ),

        ],
      ),
    );
  }

}