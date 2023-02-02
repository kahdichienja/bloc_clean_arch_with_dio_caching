// ignore_for_file: avoid_dynamic_calls

import 'package:blockpatterntest/application/typicode/typi_code_user_bloc.dart';
import 'package:blockpatterntest/model/typicode/user_api_freezed_model.dart';
import 'package:blockpatterntest/data/apiresponse/api_response.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<ApiResponse> addNewUser(TestAPIUserModel data);

  /// This method [Send & Receives] data from [Test Service] passed from the [API]
  /// It takes an instance of [CompletedOrders] as [data] required by the [API] to fetch data for specifc Test
  Future<ApiResponse> updateUser(TestAPIUserModel data);

  /// This method [Send & Receives] data from [Test Service] passed from the [API]
  /// It takes an instance of [CancelledOrders] as [data] required by the [API] to fetch data for specifc Test
  Future<ApiResponse> deleteUser(TestAPIUserModel data);

  /// This method [Send & Receives] data from [Test Service] passed from the [API]
  /// It takes [TestId] required by the [API] to fetch data for specifc Test
  // Future<List<TestAPIUserModel>?> getAllUsers();

  Future<Either<Failure, List<TestAPIUserModel>>?> getAllUsers();
}
