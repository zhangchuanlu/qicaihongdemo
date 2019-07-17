import 'package:flutter/material.dart';
import 'information_info_view.dart';
import 'package:flutter/cupertino.dart';

class InformationList extends StatefulWidget{
  _InformationListState createState()=>new _InformationListState();
}

class _InformationListState extends State<InformationList> with AutomaticKeepAliveClientMixin {
  List list=new List();

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
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        print('滑动到了底部');
        _getMore();
      }
    });
  }

  Future getDate() async{
    await Future.delayed(Duration(seconds: 2),(){
      setState(() {
        list=List.generate(15, (i)=>'哈喽,我是原始数据 $i');
      });
    });
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
    if(index<list.length){
      return  Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            child:ListTile(
              title: Text(list[index]),
              subtitle: Text('5天前'),
              trailing: Image.asset("assets/images/china.jpg",width: 70.0,height: 70.0,),
              onTap: (){
                Navigator.push(context, new CupertinoPageRoute(builder: (context)=>InformationInfo()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0,right: 10.0),
            child: Divider(height: 1.0,indent: 1.0,color: Colors.grey,),
          ),
        ],
      );
    }
    return _getMoreWidget();
  }

  Future<Null> _onRefresh() async{
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
        list = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
      });
    });
  }

  ///上拉加载更多
  Future _getMore() async{
    if(!isLoading){
      setState(() {
        isLoading=true;
      });
      await Future.delayed(Duration(seconds: 1),(){
        print('加载更多');
        setState(() {
          list.addAll(List.generate(5, (i)=>'第$_page次上拉来的数据'));
          _page++;
          isLoading=false;
        });
      });
    }
  }

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