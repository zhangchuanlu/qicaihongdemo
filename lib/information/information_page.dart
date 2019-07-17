import 'package:flutter/material.dart';
import 'package:qicaihongdemo/information/information_listview.dart';

class InformationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InformationPage();
  }
}

class _InformationPage extends State<InformationPage> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TabController(length:2,vsync: this);
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
        centerTitle: true,
        title: new Text('平台资讯',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Material(
            color: Colors.white,
            child: TabBar(
              labelColor: Colors.red,
              controller: _controller,
              indicatorSize:TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(text:"足球"),
                Tab(text:"篮球"),
              ],
            ),
          ),
        )
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          InformationList(),
          InformationList(),
        ],
      ),
    );
  }
}
