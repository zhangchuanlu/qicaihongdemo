import 'package:flutter/material.dart';

class MyCollect extends StatefulWidget{
  _MyCollectState createState()=>new _MyCollectState();
}

class _MyCollectState extends State<MyCollect>{
  List list=new List();

  ScrollController _scrollController =ScrollController();
  int _page=1;
  bool isLoading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        print("滑动到了最底部");
        _getMore();
      }
    });
  }

  //初始化数据
  Future getDate() async{
    await Future.delayed(Duration(seconds: 2),(){
      setState(() {
        list=List.generate(5, (i)=>"哈喽,我是原始数据 $i");
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(icon: Icon(Icons.navigate_before), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: ListItem,
          itemCount: list.length+1,
          controller: _scrollController,
        ),
      ),
    );
  }

  //下拉刷新
  Future<Null> _onRefresh() async{
    await Future.delayed(Duration(seconds: 3),(){
      print("refresh");
      setState(() {
        list=List.generate(20, (i)=>"哈喽,我是新刷新的 $i");
      });
    });
  }

  //内容
  Widget ListItem(BuildContext context,int index){
    if(index<list.length){
      return Column(
        children: <Widget>[
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
                  new Expanded(
                    child: Container(
                        margin: new EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text("90分钟足球", style: TextStyle( fontSize: 15.0), textAlign: TextAlign.left),
                            new Text("篮球评论员", style: TextStyle(color: Color(0xFF555555), fontSize: 12.0), textAlign: TextAlign.left)
                          ],
                        )
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text("1中0",style: TextStyle(color: Colors.grey),),
                        ClipOval(
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              width: 20.0,
                              height: 20.0,
                              child: Text("黑",style: TextStyle(color: Colors.white),),
                            )
                        )
                      ],
                    ),
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

        ],
      );
    }
    return _getMoreWidget();
  }


  //上拉加载
  Future _getMore() async{
    if(!isLoading){
      setState(() {
        isLoading=true;
      });
    }
    await Future.delayed(Duration(seconds: 1),(){
      print("加载更多");
      setState(() {
        list.addAll(List.generate(5, (i)=>"第$_page次上拉来的数据"));
        _page++;
        isLoading=false;
      });
    });
  }

  //加载动画
  Widget _getMoreWidget(){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("加载中……",style: TextStyle(fontSize: 16.0),),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }


  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }

}