import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qicaihongdemo/user_center/login.dart';
import 'package:qicaihongdemo/navigator/constants.dart';
import 'package:qicaihongdemo/events/login_event.dart';



class AppNavigator {

  static push(BuildContext context, Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  static pushLogin(BuildContext context) async {
    final result = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      print('****************************去登陆');
      return LoginPage();
    }));
    if (result != null && result == "refresh") {
      print('****************************登陆了');
      // 通知页面刷新
      Constants.eventBus.fire(LoginEvent());
    }
  }

//  static pushRoute(BuildContext context) {
//    Navigator.of(context).pushAndRemoveUntil(
//        new MaterialPageRoute(builder: (context) => new Entry()
//        ), (route) => route == null);
//  }

//  static pushWeb(BuildContext context, String url, String title) {
//    Navigator.push(context, CupertinoPageRoute(builder: (context) {
//      return WebPage(url: url, title: title);
//    }));
//  }


}
