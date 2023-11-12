
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{

  static late Dio dio;
  static init()
  {
    dio=Dio(BaseOptions(baseUrl:'https://mbag.totinco.com/api/',



    receiveDataWhenStatusError: true,

    ));
  }


  static Future<Response>getData({required String url})async
  {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':'ar',
    };
   return await dio.get(url);
  }

  static Future<Response>postData({required String url, Map<String,dynamic>? data, String?token })async
  {dio.options.headers={
    'Accept':'application/json',
    'Accept-Language':'ar',
  };


    return   dio.post(url,data: data);
  }

  static Future<Response>putData({required String url,Map<String,dynamic> ?data,String?token })async
  {

    return   dio.put(url,data: data);
  }

}