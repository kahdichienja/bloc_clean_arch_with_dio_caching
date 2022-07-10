// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_freezed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestAPIUserModel _$_$_TestAPIUserModelFromJson(Map<String, dynamic> json) {
  return _$_TestAPIUserModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    username: json['username'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    website: json['website'] as String?,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_TestAPIUserModelToJson(
        _$_TestAPIUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
      'address': instance.address,
      'company': instance.company,
    };

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    name: json['name'] as String?,
    street: json['street'] as String?,
    suite: json['suite'] as String?,
    city: json['city'] as String?,
    zipcode: json['zipcode'] as String?,
    geo: json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'name': instance.name,
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

_$_Company _$_$_CompanyFromJson(Map<String, dynamic> json) {
  return _$_Company(
    name: json['name'] as String?,
    catchPhrase: json['catchPhrase'] as String?,
    bs: json['bs'] as String?,
  );
}

Map<String, dynamic> _$_$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };

_$_Geo _$_$_GeoFromJson(Map<String, dynamic> json) {
  return _$_Geo(
    lat: json['lat'] as String?,
    lng: json['lng'] as String?,
  );
}

Map<String, dynamic> _$_$_GeoToJson(_$_Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
