// ignore_for_file: always_declare_return_types, type_annotate_public_apis, use_late_for_private_fields_and_variables, sort_constructors_first, non_constant_identifier_names

import 'package:blockpatterntest/network/interceptors/error_intercepter.dart';
import 'package:blockpatterntest/network/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';


/*
This is where dio [Http request client ] get registered and instantiated
*/
class RestClient {
  static final CacheConfig cacheConfig = CacheConfig();
  final LoggingInterceptor loggingInterceptor = LoggingInterceptor();

  static String _token = '';
  static String _pas = '';
  static String _email = '';
  static String _rest_id = '';
  static String get token => _token;
  static String get restid => _rest_id;

  static String get password => _pas;
  static String get email => _email;

  static configureApi(String token) async {
    _token = token;
  }

  static setSecurityPass({
    required String pas,
    required String em,
    required String restId,
  }) {
    _pas = pas;
    _email = em;
    _rest_id = restId;
   // debugPrint("Password:$_pas Email: $_email :RestId: $restid");
  }

  Dio? _dio;
  Dio get dio => _dio!;
  Options get cacheOptions => _cacheOptions;

  ///The data from the api is cached for [1] hours ,but auto refreshed onse the client
  //connects to the server
  final Options _cacheOptions = buildCacheOptions(
    const Duration(hours: 1),
    maxStale: const Duration(hours: 1),
    forceRefresh: true,
  );

  RestClient({BaseOptions? options}) {
    _dio = create(options);
  }

  ///Setting headers required by the api
  ///The [interceptors] acts as validators if an error occur
  ///they are caught by the interceptors

  Dio create([BaseOptions? options]) {
    final Dio dio = Dio(options);

    dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.interceptors
      ..add(ErrorInterceptor())
      ..add(DioCacheManager(cacheConfig).interceptor)
      ..add(loggingInterceptor);
    return dio;
  }
}
