library httputil;
export 'package:qicaihongdemo/util/http_result.dart';
import 'package:qicaihongdemo/util/http_result.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:qicaihongdemo/util/http_manager.dart';
import 'package:qicaihongdemo/dao/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qicaihongdemo/user_center/login.dart';
import 'package:qicaihongdemo/navigator/app_navigator.dart';



enum Method {
  GET,
  POST,
  UPLOAD,
  DOWNLOAD,
}

class HttpUtil {
  /// get请求
  get(String url, {Object params}) async {
    return await request(url, method: Method.GET, params: params);
  }

  /// post请求
  post(String url, {Object params=null, Object data=null, BuildContext context}) async {

    return await request(url, method: Method.POST, params: params, data: data, context: context);

  }

  /// 附件上传
  upLoad (var file, String fileName, String url, {Object params,data}) async{
    return await request(url,
        method: Method.UPLOAD, params: params, file: file, fileName: fileName);
  }

  /// 附件下载
  download (String url, String savePath) async{
    return await request(url, method: Method.DOWNLOAD, fileSavePath: savePath);
  }

  ///  请求部分
  request(String url,
      {Method method, Object params, Object data, var file, String fileName, String fileSavePath, BuildContext context}) async {
    try {
      Response response;

      HttpManager httpManager = HttpManager();
      var headers = await getHeaders();
      if (headers != null) {
        httpManager.options.headers = headers;
      }
      if(!url.contains('http')) {
        var baseUrl = await getBasicUrl();
        httpManager.options.baseUrl = baseUrl;
      }else httpManager.options.baseUrl = null;

      switch (method) {
        case Method.GET:
          response = await httpManager.get(url, queryParameters: params);
          break;
        case Method.POST:
          response = await httpManager.post(url,
              data: data !=null ? data : {},
              queryParameters: params!=null?params:Map()
          );
          break;
        case Method.UPLOAD:
          {
            FormData formData = new FormData();
            if (params != null) {
              formData = FormData.from(params);
            }
            formData.add("files", UploadFileInfo.fromBytes(file, fileName+'.png'));
            response = await httpManager.post(url, data: formData);
            break;
          }
        case Method.DOWNLOAD:
          response = await httpManager.download(url, fileSavePath);
          break;
      }
      return await handleDataSource(response, method, context);
    } on DioError catch (exception) {
      print(exception.toString());
      print("result_error:"  + exception.response.toString());
      if (exception.response.statusCode == 401) {
        //未登录或登录失效
        //Navigator.push(context, new MaterialPageRoute(builder: (context)=>LoginPage()));
        AppNavigator.pushLogin(context);
        return HttpResult(exception, false);
      }
      return HttpResult(exception.response.data, false);
    }
  }



  /// 数据处理
  static handleDataSource (Response response, Method method, BuildContext context){
    String errorMsg = "";
    int statusCode;
    statusCode = response.statusCode;
    print("result_success:"  + response.toString());

    if (statusCode == 401) {
      //未登录或登录失效
      //Navigator.push(context, new MaterialPageRoute(builder: (context)=>LoginPage()));
      AppNavigator.pushLogin(context);
     return HttpResult('请登录', false);
    }
    if (method == Method.DOWNLOAD) {
      if (statusCode == 200) {
        /// 下载成功
        return HttpResult('下载成功', true);
      }else{
        /// 下载失败
        return HttpResult('下载失败', false);
      }
    }
    //处理错误部分
    if (statusCode < 0) {
      errorMsg = "网络请求错误,状态码:" + statusCode.toString();
      return HttpResult(errorMsg, false);
    }
    try {
      Map data = json.decode(response.data);
      if (data['Code'] == 0 ) {
        try {
          return HttpResult(data, true);
        }catch (exception){

          return HttpResult('暂无数据', false);
        }
      }else{
        return HttpResult(data['Message'], false);
      }
    }catch(exception){
//      List data = json.decode(response.data);
      return HttpResult(response.data, true);
    }
  }

  ///获取请求头信息
  getHeaders () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {"token":prefs.getString("Token")};
  }

  ///获取请求基础路径
  getBasicUrl (){
    return API_HOST_PROD_URL;
  }


}
