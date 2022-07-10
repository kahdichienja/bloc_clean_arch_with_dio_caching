// ignore_for_file: sort_constructors_first

import 'package:blockpatterntest/network/rest_client.dart';
import 'package:blockpatterntest/network/services/config/api_path_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


// import '../rest_client.dart';
// import 'config/api_path_strings.dart';

class Api {
////Internal constructor of the Api Class
  static final _api = Api._internal();
  factory Api() {
    return _api;
  }
  Api._internal();

  ///Getting The instance of the Rest Api client
  final Dio _dioClient = RestClient().dio;

  ///Accesssing the api cache options
  ///use this if u need to cache the data
  final Options _cacheOptions = RestClient().cacheOptions;

  ///This fucnctions points perfomrs a [GET] request to the Api
  ///It takes a [path]
  ///The [Path] points to  a specific end point in the [Api]

  ///It return a [Response]
  Future<Response> getData({required String path}) async {
    //debugPrint('[Api Main Get] $baseUrl$path');
    final data = await _dioClient.get('$baseUrl$path', options: _cacheOptions);
    // debugPrint(data);
    return data;
  }

  ///This fucnctions points perfomrs a [PATCH] request to the Api
  ///It takes a [path] ,and [data] passed from [API Services]
  ///The [Path] points to  a specific end point in the [Api]

  ///It return a [Response]
  Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    if (data['password'] != null) {
      //debugPrint('[Api Main Post] NULL AUTH  : $baseUrl$path');
      final rdata = await _dioClient.post('$baseUrl$path', data: data);
      return rdata;
    } else {
      data['password'] = RestClient.password;
      data['email'] = RestClient.email;
      data['rest_id'] = RestClient.restid;
      //debugPrint('[Api Main Post] Data  : $data');
      // debugPrint('[Api Main Post] Data  : $baseUrl$path');
      final rdata = await _dioClient.post('$baseUrl$path', data: data);
      return rdata;
    }
  }

  ///This fucnctions points perfomrs a [PATCH] request to the Api
  ///It takes a [path] ,and [data] passed from [API Services]
  ///The [Path] points to  a specific end point in the [Api]

  ///It return a [Response]
  Future<Response> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    //debugPrint('[Api Main Update] Data :$data : $baseUrl$path');
    final rdata = await _dioClient.patch('$baseUrl$path', data: data);
    return rdata;
  }

  ///This fucnctions points perfomrs a [DELETE] request to the Api
  ///It takes a [path] ,and [Optional data] passed from [API Services]
  ///The [Path] points to  a specific end point in the [Api]

  ///It return a [Response]
  Future<Response> deleteData({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    //debugPrint('[Api Main Update] Data :$data : $baseUrl$path');
    final rdata = await _dioClient.delete('$baseUrl$path', data: data);
    return rdata;
  }
}
