import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'expert_info.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:qicaihongdemo/util/service.dart';
import 'package:qicaihongdemo/model/expert_model.dart';



class ExpertList extends StatefulWidget{
  ExpertList({Key key, this.type}) : super(key: key);
  final int type;
  _ExpertListState createState()=>new _ExpertListState();
}

class _ExpertListState extends State<ExpertList> with AutomaticKeepAliveClientMixin {
  List<ExpertDto> list=new List<ExpertDto>();
  List<int> followList=new List<int>();

  ScrollController _scrollController=ScrollController();
  int _page=1;
  bool isLoading=false;

  @override
  bool get wantKeepAlive => true;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
    getfollow();
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        print('滑动到了底部');
        _getMore();
      }
    });
  }

  ///获得专家列表
  Future getDate() async{
    var data={
      "PageSize":10,
      "PageNumber":_page
    };
    var param={
      "type":widget.type
    };
    HttpResult resultData;
    if(widget.type==1||widget.type==2){
      ///篮球专家或者足球专家
      resultData=await HttpUtil().post(EXPERT_LIST_URL,data: data,params:param,context: context);
    }else{
      ///已关注的专家
      resultData=await HttpUtil().post(EXPERT_FOLLOW_URL,data: data,context: context);
    }

    if(resultData.result){
      Expert expertList=Expert.fromJson(resultData.data);
      setState(() {
        list.addAll(expertList.data.data);
        _page++;
      });
    }else{
      throw Exception(resultData.data);
    }
  }

  ///获得全部关注的专家
  Future getfollow() async{
    var data={
      "PageSize":10000,
      "PageNumber":1
    };
    HttpResult resultData=await HttpUtil().post(EXPERT_FOLLOW_URL,data: data,context: context);
    if(resultData.result){
      Expert expertList=Expert.fromJson(resultData.data);
      setState(() {
        for(int i=0;i<expertList.data.data.length;i++){
          followList.add(expertList.data.data[i].expertId);
        }
      });
    }else{
      throw Exception(resultData.data);
    }
  }



  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemBuilder: _renderRow,
        itemCount: list.length+1,
        controller: _scrollController,
      ),
    );
  }

  Widget _renderRow(BuildContext context,int index){
    Widget follow;

    if(index<list.length){
      if(followList.contains(list[index].expertId)){
        follow=Container(
          margin: EdgeInsets.only(top: 5.0),
          alignment: Alignment.center,
          width: 50,
          height: 20,
          child: Text("已关注",style: TextStyle(fontSize: 12.0,color: Colors.red),),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)),
        );
      }else{
        follow=Container(
          margin: EdgeInsets.only(top: 5.0),
          alignment: Alignment.center,
          width: 40,
          height: 20,
          child: Text("关注",style: TextStyle(fontSize: 12.0,color: Colors.white),),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0)),
        );
      }

      String ExpertType="";
      for(int i=0;i<list[index].expertTypeList.length;i++){
        ExpertType+=list[index].expertTypeList[i].typeName+'、';
      }
      ExpertType=ExpertType.substring(0,ExpertType.length-1);
      String MatchType ="";
      for(int i=0;i<list[index].matchTypeList.length;i++){
        MatchType+=list[index].matchTypeList[i].matchName+'、';
      }
      MatchType=MatchType.substring(0,MatchType.length-1);
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      ClipOval(
                        child: Image.network(list[index].avatar,width: 50.0, height: 50.0,fit: BoxFit.fitWidth,),
                      ),
                      GestureDetector(
                          child: follow
                      )
                    ],
                  )
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(list[index].expertName,style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                        child: Text(ExpertType,style: TextStyle(color: Colors.grey),),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text("擅长联赛"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.0),
                              padding: EdgeInsets.only(left: 5.0,right:  5.0),
                              alignment: Alignment.center,
                              child: Text(MatchType,style: TextStyle( fontSize: 12.0),),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(3.0)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: new EdgeInsets.only( top: 10.0,right: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(list[index].hiTrate.toString(),style: TextStyle(color: Colors.red,fontSize: 25),),
                        Text("%",style: TextStyle(color: Colors.red,fontSize: 10),)
                      ],
                    ),
                    Text("命中率",style: TextStyle(color: Colors.red,fontSize: 10.0),)
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: (){
          Navigator.push(context, new CupertinoPageRoute(builder: (context)=>ExpertInfo()));
        },
      );
    }
    //return _getMoreWidget();
  }

///下拉刷新
  Future<Null> _onRefresh() async{
    setState(() {
      _page=1;
      list.clear();
    });
    getDate();
  }

  ///上拉加载更多
  Future _getMore() async{
    if(!isLoading){
      setState(() {
        isLoading=true;
      });
      getDate();
      setState(() {
        isLoading=false;
      });

    }
  }

  ///加载中……
  Widget _getMoreWidget(){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中……',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  dispose(){
    super.dispose();
    _scrollController.dispose();
  }


}