
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/App_Exception.dart';
import 'package:getx_mvvm/data/Network/Base_Api_Service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService{


  @override
  Future<dynamic> getAPi(String url)async{
    dynamic responseJson ;

    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postAPi(var data, String url)async{
    dynamic responseJson ;

    try{
      final response = await http.post(Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    if(kDebugMode){
      print(responseJson);
    }
    return responseJson;
  }



  dynamic returnResponse(http.Response response){
    print(response.body.toString());
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException('Error accoured while communicating with server  ${response.statusCode}');
    }
  }

}