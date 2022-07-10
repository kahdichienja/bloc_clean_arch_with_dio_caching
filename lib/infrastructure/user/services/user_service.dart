import 'package:blockpatterntest/network/base_api.dart';
import 'package:dio/dio.dart';



/*
All Api services are registered here
The api providers point here to get access to the api class

*/
abstract class UserApiService extends BaseApi {

  ///It takes a [data] and pases the [data] and [path]
  ///The [Path] points to  a specific end point in the [Api]

  Future<Response?> addNewUser(Map<String, dynamic> data);


  ///It takes a [data] and pases the [data] and [path]
  ///The [Path] points to  a specific end point in the [Api]

  Future<Response> updateUser(Map<String, dynamic> data);


  ///It takes a [data] and pases the [data] and [path]
  ///The [Path] points to  a specific end point in the [Api]

  Future<Response> deleteUser(Map<String, dynamic> data);


  ///it takes a [Path] which is made up of the url 

  Future<Response> getUsers();

}
