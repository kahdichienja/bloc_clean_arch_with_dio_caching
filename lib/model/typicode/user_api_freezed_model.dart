// ignore_for_file: require_trailing_commas

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_api_freezed_model.freezed.dart';
part 'user_api_freezed_model.g.dart';

@freezed
abstract class TestAPIUserModel with _$TestAPIUserModel {
  factory TestAPIUserModel({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
    Address? address,
    Company? company,

  }) = _TestAPIUserModel;

  factory TestAPIUserModel.fromJson(Map<String, dynamic> json) =>
      _$TestAPIUserModelFromJson(json);
}
@freezed
abstract class Address with _$Address {
  factory Address({

    String? name,
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo


  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
@freezed
abstract class Company with _$Company {
  factory Company({

    String? name,
    String? catchPhrase,
    String? bs,


  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}


@freezed
abstract class Geo with _$Geo {
  factory Geo({
    String? lat,
    String? lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}
