import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:qicaihongdemo/match/mach_plan_info.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin{
  List<Widget> imageList = List();

  TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length:2,vsync: this);
    setState(() {
      imageList
        ..add(Image.asset(
          'assets/images/wulei.jpg',
          fit: BoxFit.fill,
        ))
        ..add(Image.asset(
          'assets/images/huerke.jpg',
          fit: BoxFit.fill,
        ))
        ..add(Image.asset(
          'assets/images/meixi.jpg',
          fit: BoxFit.fill,
        ))
        ..add(Image.asset(
          'assets/images/timg.jpg',
          fit: BoxFit.fill,
        ))
        ..add(Image.asset(
          'assets/images/kaien.jpg',
          fit: BoxFit.fill,
        ))
        ..add(Image.asset(
          'assets/images/liyi.jpg',
          fit: BoxFit.fill,
        ));
    });

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
          preferredSize: Size.fromHeight(192),
          child: new Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Column(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: Swiper(
                        itemBuilder: _swiperBuilder,
                        itemCount: 6,
                        pagination: new SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.black54,
                              activeColor: Colors.white,
                            )),
                        control: new SwiperControl(
                            size: 0
                        ),
                        scrollDirection: Axis.horizontal,
                        autoplay: true,
                        onTap: (index) => print('点击了第$index个'),
                      )),
                  Material(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: Colors.red,
                      controller: _controller,
                      indicatorSize:TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.black,
                      tabs: <Widget>[
                        Tab(text:"足球专家"),
                        Tab(text:"篮球专家"),
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
          Football(),
          Text("222"),
        ],
      ),
    );
  }


  Widget Football(){
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  expert(),
                  expert(),
                  expert(),
                  expert(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  expert(),
                  expert(),
                  expert(),
                  expert(),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(top: 10,bottom: 10),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("全部"),
                ),
              ),
              Expanded(
                child: PopupMenuButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text("联赛"),
                      ),
                      Container(
                        child: Icon(Icons.expand_more),
                      )
                    ],
                  ),
                  onSelected:(String value){

                  },
                  itemBuilder: (BuildContext context)=><PopupMenuItem<String>>[
                    new PopupMenuItem(
                        value:"选项一的内容",
                        child: new Text("选项一")
                    ),
                    new PopupMenuItem(
                        value: "选项二的内容",
                        child: new Text("选项二")
                    )
                  ],
                )
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Divider(height: 1.0,indent: 1.0,color: Colors.grey,),
              Plan(),
              Plan(),
              Plan(),
              Plan(),
            ],
          ),
        )
      ],
    );
  }


  Widget expert(){
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ClipOval(
              child: Image.asset("assets/images/china.jpg",width: 50.0, height: 50.0,fit: BoxFit.fitWidth,),
            ),
            Container(
              child: Text("王也"),
            )
          ],
        ),
      ),
    );
  }


  Widget Plan(){
    return GestureDetector(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 10),
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


  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

}