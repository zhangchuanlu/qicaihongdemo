import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'mach_plan.dart';

class MatchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MatchPage();
  }
}

class _MatchPage extends State<MatchPage> with SingleTickerProviderStateMixin {


  TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length:3,vsync: this);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1.0,
          bottom: new PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: new Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: CupertinoSegmentedControl<int>(
                      children: {
                        1:Padding(padding: EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),child: Text("关注"),),
                        2:Padding(padding: EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),child: Text("足球"),),
                        3:Padding(padding: EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),child: Text("篮球"),),
                      },
                      onValueChanged: (value){
                        print("the value changed ! $value");
                      },
                      borderColor: Colors.white,
                      selectedColor: Colors.white,
                      unselectedColor: Colors.red,
                      pressedColor: Colors.white,
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: Colors.red,
                      controller: _controller,
                      indicatorSize:TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.black,
                      tabs: <Widget>[
                        Tab(text:"即时"),
                        Tab(text:"赛果"),
                        Tab(text:"赛程"),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          ListView(
            children: <Widget>[
              ListItem()
            ],
          ),
          ListView(
            children: <Widget>[
              ListItem()
            ],
          ),
          ListView(
            children: <Widget>[
              ListItem()
            ],
          ),
        ],
      ),
    );
  }

  Widget ListItem(){
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: 90.0,
                  height: 20.0,
                  alignment: Alignment.center,
                  child: Text("05/18 6:00",style: TextStyle(fontSize: 13.0),),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text("进行中",style: TextStyle(color: Colors.orange,fontSize: 13.0),),
                ),
                Container(
                  child: Text("韩职",style: TextStyle(color: Colors.grey,fontSize: 13.0),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Text("全北现代"),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10.0,right: 10.0),
                    child:ClipOval(
                      child: new Image.asset('assets/images/china.jpg',width: 30.0, height: 30.0,fit: BoxFit.fitWidth,),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Text("0:0",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10.0,right: 10.0),
                    child: ClipOval(
                      child: new Image.asset('assets/images/china.jpg',width: 30.0, height: 30.0,fit: BoxFit.fitWidth,),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Text("济州联"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                  alignment: Alignment.center,
                  height: 20.0,
                  width: 30,
                  child: Text("竞足",style: TextStyle(color: Colors.blue, fontSize: 12.0),),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(3.0)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10.0,bottom: 10.0),
                    alignment: Alignment.centerRight,
                    child:Text("0个方案>",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 12.0),),
                  ),
                )
              ],
            ),
            Divider(height: 1.0,indent: 1.0,color: Colors.grey,),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, new CupertinoPageRoute(builder: (context)=>MachPlan()));
      },
    );
  }

}
