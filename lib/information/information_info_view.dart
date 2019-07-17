import 'package:flutter/material.dart';

class InformationInfo extends StatefulWidget{

//  final String title;
//  InformationInfo({Key key, this.title}) : super(key: key);
  _InformationState createState()=>new _InformationState();
}

class _InformationState extends State<InformationInfo>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("足球资讯"),
        leading:  IconButton(icon: Icon(Icons.navigate_before), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: Colors.red,
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Text("萨拉赫萨拉赫萨拉赫",style: TextStyle(fontSize: 16.0),),
              margin: EdgeInsets.all(10.0),
            ),
            Container(
              child: Image.asset('assets/images/china.jpg'),
              margin: EdgeInsets.all(10.0),
            ),
            Container(
              child: Text("博格巴博格巴博格巴博格巴博格巴，萨拉赫萨拉赫萨拉赫萨拉赫萨拉赫，凯恩凯恩凯恩凯恩凯恩，博格巴博格巴博格巴博格巴博格巴，萨拉赫萨拉赫萨拉赫萨拉赫萨拉赫，凯恩凯恩凯恩凯恩凯恩，博格巴博格巴博格巴博格巴博格巴，萨拉赫萨拉赫萨拉赫萨拉赫萨拉赫，凯恩凯恩凯恩凯恩凯恩，"),
              margin: EdgeInsets.all(10.0),
            )
          ],
        ),
      )
    );
  }
}