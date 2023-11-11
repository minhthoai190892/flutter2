// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dio/dio.dart';

// import 'package:ulearning_app/common/utils/constants.dart';
// import 'package:ulearning_app/global.dart';

// class HttpUtil {
//   late Dio dio;
//   static final HttpUtil _instance = HttpUtil._internal();
//   factory HttpUtil() {
//     // print('printing http instance');
//     return _instance;
//   }
//   HttpUtil._internal() {
//     BaseOptions options = BaseOptions(
//       baseUrl: AppConstants.SERVER_API_URL,
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 5),
//       headers: {},
//       contentType: "application/json: charset=utf-8",
//       responseType: ResponseType.json,
//     );
//     dio = Dio(options);
//     // kiểm tra liên kết dữ liệu
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) {
//         print('new request ');
//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         print(response.data);
//         print('new response ');
//         return handler.next(response);
//       },
//       onError: (DioException e, handler) {
//         print('my error is $e ');
//         ErrorEntity eInfo = createErrorEntity(e);
//         onError(eInfo);
//       },
//     ));
//   }
//   Map<String, dynamic>? getAuthorizationHeader() {
//     var headers = <String, dynamic>{};
//     var accessToken = Global.storageService.getUserToken();
//     if (accessToken.isNotEmpty) {
//       headers['Authorization'] = 'Bearer $accessToken';
//     }
//     return headers;
//   }

//   Future post(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) async {
//     Options requestOptions = options ?? Options();
//     requestOptions.headers = requestOptions.headers ?? {};
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       requestOptions.headers!.addAll(authorization);
//     }

//     var response = await dio.post(
//       path,
//       data: data,
//       queryParameters: queryParameters,
//       options: requestOptions,
//     );
//     return response.data;
//   }
// }

// class ErrorEntity implements Exception {
//   int code = -1;
//   String message = '';
//   ErrorEntity({
//     required this.code,
//     required this.message,
//   });

//   @override
//   String toString() => 'ErrorEntity(code: $code, message: $message)';
// }

// ErrorEntity createErrorEntity(DioException error) {
//   switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//       return ErrorEntity(code: -1, message: 'Connection timeout');
//     case DioExceptionType.sendTimeout:
//       return ErrorEntity(code: -1, message: 'Send timeout');
//     case DioExceptionType.receiveTimeout:
//       return ErrorEntity(code: -1, message: 'Receive timeout');
//     case DioExceptionType.badCertificate:
//       return ErrorEntity(code: -1, message: 'Bad certificate');
//     case DioExceptionType.badResponse:
//       switch (error.response!.statusCode) {
//         case 400:
//           return ErrorEntity(code: 400, message: 'request syntax error');
//         case 401:
//           return ErrorEntity(code: 401, message: 'permission denied');
//       }
//       return ErrorEntity(code: -1, message: 'Bad Response');
//     case DioExceptionType.cancel:
//       return ErrorEntity(code: -1, message: 'Cancel');
//     case DioExceptionType.connectionError:
//       return ErrorEntity(code: -1, message: 'Connection error');
//     case DioExceptionType.unknown:
//       return ErrorEntity(code: -1, message: 'Unknown');
//   }
// }

// void onError(ErrorEntity eInfo) {
//   print('error.code -> ${eInfo.code}, error.message->${eInfo.message}');
//   switch (eInfo.code) {
//     case 400:
//       print('Server system error');
//       break;
//     case 401:
//       print('You are denied to continue');
//       break;
//     case 500:
//       print('Internal Server Error');
//       break;
//     default:
//       print('Unknown error');
//       break;
//   }
// }
import 'package:dio/dio.dart';

import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    print('printing http instance');
    return _instance;
  }
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('app request data: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('app response data: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print('app error data $e');
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
      },
    ));
  }
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = 1;
  String message = "";
  ErrorEntity({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    if (message == "") {
      return "Exception";
    }
    return 'Exception(code: $code, message: $message)';
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: 'Connection timeout');
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: 'Send timeout');
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: 'Receive timeout');
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: 'Bad certificate');
    case DioExceptionType.badResponse:
      print('bad response.........');
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: 'Request syntax error');
        case 401:
          return ErrorEntity(code: 401, message: 'permission denied');
      }
      return ErrorEntity(code: -1, message: 'Server bad response');
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: ' cancel');
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: 'Connection error');
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: 'Unknown error');
  }
}

void onError(ErrorEntity eInfo) {
  print('error.code: -> ${eInfo.code}, error.message-> ${eInfo.message}');
  switch (eInfo.code) {
    case 401:
      print('you are denied to continue');
      break;
    case 500:
      print('Internal Server Error');
      break;
    case 400:
      print('Server syntax error');
      break;
    default:
      print('Unknown error');
      break;
  }
}
