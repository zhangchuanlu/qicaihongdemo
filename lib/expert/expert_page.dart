import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'expert_info.dart';
import 'expert_list.dart';


class ExpertPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ExpertPage();
  }
}

class _ExpertPage extends State<ExpertPage>  with SingleTickerProviderStateMixin{
  TabController controller;
  var tabs = <Widget>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = <Widget>[
      Tab(text: "关注",),
      Tab(text: "足球",),
      Tab(text: "篮球",),
    ];
    controller =
        TabController( initialIndex: 0,length: tabs.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: Container(
          height: 20,
          child: TabBar(
            controller: controller,
            tabs: tabs,
            isScrollable: true,
            indicatorWeight:1,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            indicator:BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10.0),
            ),
            unselectedLabelColor: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help,color: Colors.white,),
            onPressed: (){
              print("?");
            },
          )
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          ExpertList(type: 3,),
          ExpertList(type: 1,),
          ExpertList(type: 2,),
        ],
      ),
    );
  }


}
