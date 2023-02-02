import 'package:blockpatterntest/infrastructure/typicode/services/user_service.dart';
import 'package:blockpatterntest/data/base_api.dart';
import 'package:blockpatterntest/data/services/config/api_path_strings.dart';
import 'package:dio/dio.dart';

class IUserApiService extends UserApiService implements BaseApi{

  @override
  Future<Response?> addNewUser(Map<String, dynamic> data) {
    // TODO: implement addNewUser
    throw UnimplementedError();
  }

  @override
  Future<Response> deleteUser(Map<String, dynamic> data) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Response> getUsers() async => api.getData(path: users);

  @override
  Future<Response> updateUser(Map<String, dynamic> data) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  
}