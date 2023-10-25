// // import 'dart:io';
// // import 'package:dio/dio.dart';
// //
// // class AuthInterceptor extends QueuedInterceptorsWrapper {
// //   AuthInterceptor(this._authentManager, this._apiInterceptor);
// //
// //   final AuthentManager _authentManager;
// //   final Interceptor _apiInterceptor;
// //
// //   @override
// //   // ignore: avoid_void_async
// //   void onError(DioError err, ErrorInterceptorHandler handler) async {
// //     //On Unauthorized, the AccessToken or RefreshToken may be outdated
// //     if (err.response?.statusCode == HttpStatus.unauthorized) {
// //       print('AuthInterceptor - Error 401');
// //       final accessToken = await _authentManager.getAccessTokenFromStorage();
// //
// //       //Happens on first request if badly handled
// //       //Or if the user cleaned his local storage at Runtime
// //       if (accessToken == null || accessToken.isEmpty) {
// //         print('AuthInterceptor - No Local AccessToken');
// //         return handler.next(err);
// //       }
// //
// //       try {
// //         print('AuthInterceptor - Starting Refresh Flow');
// //         //Refresh token Flow
// //         final refreshResult = await _authentManager.refreshToken();
// //         final token = refreshResult.dataOrThrow as TokenJWT;
// //
// //         //Getting the retry request
// //         final response = await _getRetryRequest(err, token);
// //         print('AuthInterceptor - Response retrieved, proceeding');
// //
// //         return handler.resolve(response);
// //       } on DioError catch (e) {
// //         print('AuthInterceptor - Error when retrying with a new Refresh');
// //         //API Key is Expired OR
// //         //Refresh token is Expired
// //         if (e.response?.statusCode == 401) {
// //           print('AuthInterceptor - Error 401 retrying with a new Refresh');
// //         }
// //       } on NetworkError catch (e) {
// //         if (e.type == NetworkErrorType.unauthorized) {
// //           debugPrint('AuthInterceptor - Error 401 retrying with a new Refresh');
// //         }
// //       } catch (e) {
// //         print('Error during retry - $e');
// //       }
// //     }
// //
// //     handler.next(err);
// //   }
// //
// //   Future<Response> _getRetryRequest(DioError err, TokenJWT token) async {
// //     print('AuthInterceptor - Building Retry Request');
// //     //Can crash but we're in a try catch
// //     final requestOptions = err.response!.requestOptions;
// //     requestOptions.headers[ApiHeaders.authorization] =
// //     'Bearer ${token.accessToken}';
// //
// //     final options = Options(
// //       method: requestOptions.method,
// //       headers: requestOptions.headers,
// //     );
// //
// //     final dioRefresh = Dio(
// //       BaseOptions(
// //         baseUrl: requestOptions.baseUrl,
// //         headers: <String, String>{
// //           HttpHeaders.acceptHeader: 'application/json',
// //         },
// //       ),
// //     );
// //
// //     //Need to inject our custom API Interceptor
// //     //Because of the temp instance of Dio
// //     dioRefresh.interceptors.add(_apiInterceptor);
// //
// //     print(
// //       'AuthInterceptor - Triggering Request with '
// //           '${requestOptions.path}, '
// //           '${requestOptions.data}, '
// //           '${requestOptions.queryParameters}, '
// //           '${options.headers}',
// //     );
// //
// //     final response = await dioRefresh.request<dynamic>(
// //       requestOptions.path,
// //       data: requestOptions.data,
// //       queryParameters: requestOptions.queryParameters,
// //       options: options,
// //     );
// //
// //     return response;
// //   }
// //
// //   @override
// //   // ignore: avoid_void_async
// //   void onRequest(
// //       RequestOptions options,
// //       RequestInterceptorHandler handler,
// //       ) async {
// //     //Getting cached Access Token, or getting it from storage and caching it
// //     var accessToken = _authentManager.currentAccessToken;
// //     accessToken ??= await _authentManager.getAccessTokenFromStorage();
// //
// //     options.headers.addAll(
// //       <String, String>{
// //         ApiHeaders.authorization: 'Bearer $accessToken',
// //         HttpHeaders.contentTypeHeader: 'application/json',
// //       },
// //     );
// //
// //     handler.next(options);
// //   }
// // }
// import 'package:dio/dio.dart';
// import 'package:Kitchen_system/helper/cache_helper.dart';
// import 'package:Kitchen_system/utill/app_constants.dart';
// import 'package:Kitchen_system/view/screen/auth/services/auth_services.dart';
//
// class AuthInterceptor extends Interceptor {
//   final services = AuthServices();
//
//   // final String refreshToken;
//   // final Dio dio;
//
//   @override
//   Future<void> onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final token = await _getToken();
//
//     if (token != null) {
//       options.headers.addAll({'Authorization': 'Bearer $token'});
//     }
//     return super.onRequest(options, handler);
//   }
//
//   Future<String?> _getToken() async {
//     final token = await _getAccessToken();
//     if (token != null) {
//       return token;
//     }
//
//     return _refreshToken();
//   }
//
//   Future<String?> _getAccessToken() async {
//     // TODO: implement code to get access token from storage or API
//     if (differenceBetweenExpireNow() < 1) {
//       return null;
//     } else {
//       final token = CacheHelper.getData(key: AppConstants.token);
//       return token;
//     }
//   }
//
//   Future<String?> _refreshToken() async {
//     try {
//       // TODO: implement code to refresh token using refresh token
//       // and store the new access token
//
//       return null;
//     } on DioError catch (e) {
//       // Handle DioError exceptions thrown during token refresh
//       if (e.response?.statusCode == 401) {
//         // If the refresh token is invalid, return null
//         return null;
//       } else {
//         // If there is another error, throw an exception
//         rethrow;
//       }
//     } catch (e) {
//       // Handle other exceptions thrown during token refresh
//       print(e);
//       return null;
//     }
//   }
//
//   int differenceBetweenExpireNow() {
//     if (CacheHelper.getData(key: AppConstants.expireOn) != null) {
//       DateTime expireDate =
//           DateTime.parse(CacheHelper.getData(key: AppConstants.expireOn));
//       DateTime now = DateTime.now();
//       int diff = expireDate.difference(now).inHours;
//       return diff;
//     } else {
//       return 0;
//     }
//   }
// }
