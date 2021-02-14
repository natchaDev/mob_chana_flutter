import 'package:dio/dio.dart' as Http;
import 'package:mob_chana_flutter/commons/data/mock_data_loader.dart';
import 'package:mob_chana_flutter/data/services/base_service_failure.dart';
import '../../application/env.dart';
import '../../commons/log.dart';
import '../../di/container.dart';
import '../preferences/user_preference.dart';

class BaseService {
  final String baseUrl;
  final bool usingMockData;
  final UserPreference userPreference;
  final String _env;

  final MockDataLoader _mockDataLoader = MockDataLoader();
  final Http.Dio _dio;

  BaseService(EnvironmentConfig env, {this.baseUrl})
      : _env = '${env.runtimeType}',
        usingMockData = env.isUsingMockApiData,
        userPreference = inject<UserPreference>(),
        _dio = inject<Http.Dio>() {
    initSetting();
  }

  void initSetting() {
    _dio.interceptors.add(
      Http.InterceptorsWrapper(
        onRequest: (Http.RequestOptions options) async {
          final token = await userPreference.getIdToken();
          if (token != null && !(options?.path ?? '').endsWith('/auth')) {
            options.headers["Authorization"] = "Bearer $token";
          }
          AppLog.i(
            {
              "ENV": _env,
              //TODO: Fix log request (Error: Value not in range)
//              "REQUEST":
//                  "[${options?.method}] => ${options?.path?.substring(basePath('').length)}",
              "QUERIES": "${options?.queryParameters}",
              "HEADERS": "${options?.headers}",
              "PAYLOAD": options?.data
            },
          );
        },
        onResponse: (Http.Response response) async {
          AppLog.i({"RESPONSE": "[${response.statusCode}] ${response.statusMessage}", "HEADERS": "${response?.headers}", "PAYLOAD": response?.data});
        },
      ),
    );
  }

  String basePath(String path) => "$baseUrl$path";

  // REST API Method

  Future<Http.Response<Map<String, dynamic>>> _get(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      return await _dio.get<Map<String, dynamic>>(
        includeBasePath ? basePath(path) : path,
        queryParameters: queryParameters,
      );
    } on Http.DioError catch (e) {
      if (e.type != Http.DioErrorType.RESPONSE) throw e;
      return e.response.mapData((data) => data as Map<String, dynamic>);
    }
  }

  Future<Http.Response<List<dynamic>>> _getArray(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      return await _dio.get<List<dynamic>>(
        includeBasePath ? basePath(path) : path,
        queryParameters: queryParameters,
      );
    } on Http.DioError catch (e) {
      if (e.type != Http.DioErrorType.RESPONSE) throw e;
      return e.response.mapData((data) => data as List<dynamic>);
    }
  }

  Future<Http.Response<Map<String, dynamic>>> _post(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> data,
  }) async {
    try {
      return await _dio.post(
        includeBasePath ? basePath(path) : path,
        queryParameters: queryParameters,
        data: data,
      );
    } on Http.DioError catch (e) {
      if (e.type != Http.DioErrorType.RESPONSE) throw e;
      return e.response.mapData((data) => data as Map<String, dynamic>);
    }
  }

  Future<Http.Response<Map<String, dynamic>>> _put(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> data,
  }) async {
    try {
      return await _dio.put(
        includeBasePath ? basePath(path) : path,
        queryParameters: queryParameters,
        data: data,
      );
    } on Http.DioError catch (e) {
      if (e.type != Http.DioErrorType.RESPONSE) throw e;
      return e.response.mapData((data) => data as Map<String, dynamic>);
    }
  }

  Future<Http.Response<Map<String, dynamic>>> _delete(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      return await _dio.delete(
        includeBasePath ? basePath(path) : path,
        queryParameters: queryParameters,
      );
    } on Http.DioError catch (e) {
      if (e.type != Http.DioErrorType.RESPONSE) throw e;
      return e.response.mapData((data) => data as Map<String, dynamic>);
    }
  }

  // |=====================================================================
  // | Shorthand
  // |=====================================================================

  Future<Http.Response<Map<String, dynamic>>> get(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
    Http.Response<Map<String, dynamic>> mockResponse,
  }) async {
    if (usingMockData) {
      mockResponse?.throwToFailureResponseExceptionWhen((res) => res.statusCode != 200);
      return mockResponse;
    }
    return await _get(
      path,
      includeBasePath: includeBasePath,
      queryParameters: queryParameters,
    );
  }

  Future<Http.Response<List<dynamic>>> getArray(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
    Http.Response<List<dynamic>> mockResponse,
  }) async {
    if (usingMockData) {
      mockResponse?.throwToFailureResponseExceptionWhen((res) => res.statusCode != 200);
      return mockResponse;
    }
    return await _getArray(
      path,
      includeBasePath: includeBasePath,
      queryParameters: queryParameters,
    );
  }

  Future<Http.Response<Map<String, dynamic>>> post(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> data,
    Http.Response mockResponse,
  }) async {
    if (usingMockData) {
      mockResponse?.throwToFailureResponseExceptionWhen((res) => res.statusCode != 200);
      return mockResponse;
    }
    return await _post(
      path,
      includeBasePath: includeBasePath,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<Http.Response<Map<String, dynamic>>> put(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> data,
    Http.Response mockResponse,
  }) async {
    if (usingMockData) {
      mockResponse?.throwToFailureResponseExceptionWhen((res) => res.statusCode != 200);
      return mockResponse;
    }
    return await _put(
      path,
      includeBasePath: includeBasePath,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<Http.Response<Map<String, dynamic>>> delete(
    String path, {
    bool includeBasePath = true,
    Map<String, dynamic> queryParameters,
    Http.Response mockResponse,
  }) async {
    if (usingMockData) {
      mockResponse?.throwToFailureResponseExceptionWhen((res) => res.statusCode != 200);
      return mockResponse;
    }
    return await _delete(
      path,
      includeBasePath: includeBasePath,
      queryParameters: queryParameters,
    );
  }
}

extension MockBaseService on BaseService {
  Future<Http.Response<Map<String, dynamic>>> mockResponseFromJsonFile(
    String mockDataFilename, [
    Http.Response baseResponse,
  ]) async {
    if (usingMockData && mockDataFilename == null) {
      throw Exception('base_service usingMockData but no mock data filename sent');
    }
    var res = baseResponse ?? Http.Response<Map<String, dynamic>>(statusCode: 200);
    res.data = await _mockDataLoader.load(mockDataFilename);
    return res;
  }

  Future<Http.Response<List<dynamic>>> mockResponseArrayFromJsonFile(
    String mockDataFilename, [
    Http.Response baseResponse,
  ]) async {
    if (usingMockData && mockDataFilename == null) {
      throw Exception('base_service usingMockData but no mock data filename sent');
    }
    var res = baseResponse ?? Http.Response<List<dynamic>>(statusCode: 200);
    res.data = await _mockDataLoader.loadArray(mockDataFilename);
    return res;
  }
}

extension ExtendResponse<I> on Http.Response<I> {
  Http.Response<O> mapData<O>(O Function(I data) mapper) {
    return Http.Response<O>(
      data: mapper(data),
      headers: headers,
      request: request,
      isRedirect: isRedirect,
      statusCode: statusCode,
      statusMessage: statusMessage,
      redirects: redirects,
      extra: extra,
    );
  }
}
