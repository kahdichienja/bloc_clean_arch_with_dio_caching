import 'dart:io';

import 'package:blockpatterntest/application/typicode/typi_code_user_bloc.dart';
import 'package:blockpatterntest/network/apiresponse/api_response.dart';
import 'package:blockpatterntest/domain/typicode/services/i_user_service.dart';
import 'package:blockpatterntest/infrastructure/typicode/repository/user_repository.dart';
import 'package:blockpatterntest/model/typicode/user_api_freezed_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class IUserRepository extends UserRepository {
  IUserApiService userApiService = IUserApiService();
  @override
  Future<ApiResponse> addNewUser(TestAPIUserModel data) {
    // TODO: implement addNewUser
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> deleteUser(TestAPIUserModel data) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  // @override
  // Future<List<TestAPIUserModel>?> getAllUsers() async {
  //   try {
  //     ///[Response] from the [API]
  //     final Response response = await userApiService.getUsers();

  //     ///[debugPrint]s [API] response for [DEBUG] purposes
  //     debugPrint('[API PROVIDER RESPONSE] ${response.data}');

  //     ///[Validation] if the fetch was a [SUCCESS]
  //     if (response.statusCode == 200) {

  //       ///Return [DATA] of type [ApiResponse] which wraps [data,hasError,List of Errors]
  //       ///This will return an instance of [ApiResponse] containig [Instance of TestStatusResponse,hasError(false),error message (null) ]
  //       ///
  //       List<TestAPIUserModel> testAPIUser = <TestAPIUserModel>[];

  //       response.data.forEach((users) => testAPIUser.add(TestAPIUserModel.fromJson(users)));

  //       return testAPIUser;
  //     } else {
  //       /// if there is an error in the response
  //       /// this is the data returned
  //       /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
  //       // showCustomSnackBar(e.toString(), context);
  //       return null;
  //     }
  //   } catch (e) {
  //     /// if there is an error in the [HTTP REQUEST]
  //     /// this is the data returned
  //     /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
  //     //  showCustomSnackBar(e.toString(), context);

  //     return null;
  //   }
  // }

  @override
  Future<ApiResponse> updateUser(TestAPIUserModel data) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TestAPIUserModel>>?> getAllUsers() async {
    try {
      ///[Response] from the [API]
      final Response response = await userApiService.getUsers();

      ///[debugPrint]s [API] response for [DEBUG] purposes
      debugPrint('[API PROVIDER RESPONSE] ${response.data}');

      ///[Validation] if the fetch was a [SUCCESS]
      if (response.statusCode == 200) {
        ///
        List<TestAPIUserModel> testAPIUser = <TestAPIUserModel>[];

        response.data.forEach(
            (users) => testAPIUser.add(TestAPIUserModel.fromJson(users)));

        return Right(testAPIUser);
      } else {
        /// if there is an error in the response
        /// this is the data returned
        /// find a way of returning api error
        return Left(Failure(response.statusMessage.toString()));
      }
    } catch (e) {
       if (e is DioError) {
        return Left(Failure(e.message));
      }else if (e is SocketException) {
        return Left(Failure('No Internet connection 😑'));
      } else if (e is HttpException) {
        return Left(Failure("Couldn't find the post 😱"));
      } else if (e is FormatException) {
        return Left(Failure("Bad response format 👎"));
      } 
    }
  }
}
