import 'package:dio/dio.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioUtilNew {
  static DioUtilNew? _instance;
  static Dio? _dio;

  static DioUtilNew? getInstance() {
    if (_instance == null) {
      _dio = Dio(_getOptions());
      // _dio!.interceptors.add(LoggingInterceptor());
      _dio!.interceptors.add((PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      )));
    }
    return _instance;
  }

  static Dio? get dio => _dio;

  static void setDioAgain() {
    _dio = Dio(_getOptions());
  }

  static BaseOptions _getOptions() {
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) => status! <= 500,
    );

    options.connectTimeout = 20 * 1000; //10 sec
    options.receiveTimeout = 20 * 1000; //20 sec
    options.baseUrl = AppConstants.baseurl;
    options.headers = {
      // 'Content-type': 'application/json',
      // 'Accept': 'application/json',
      //'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJoZXNoYW1AZ21haWwiLCJqdGkiOiIzZjkyN2EzYy1hNjM3LTQwOGUtYjQ2MC0zMTg4MTY2ZDI2NDAiLCJ1aWQiOiIxMDA2IiwiUGVybWlzc2lvbiI6WyJQZXJtaXNzaW9ucy5TdGF0dXNDYXRlZ29yeS5BZGRTdGF0dXNDYXRlZ29yeSIsIlBlcm1pc3Npb25zLlN0YXR1c0NhdGVnb3J5LkdldEFsbFN0YXR1c0NhdGVnb3J5cyIsIlBlcm1pc3Npb25zLlN0YXR1c0NhdGVnb3J5LkdldFN0YXR1c0NhdGVnb3J5QnlJZCIsIlBlcm1pc3Npb25zLlN0YXR1c0NhdGVnb3J5LkRlbGV0ZVN0YXR1c0NhdGVnb3J5IiwiUGVybWlzc2lvbnMuU3RhdHVzQ2F0ZWdvcnkuVXBkYXRlU3RhdHVzQ2F0ZWdvcnkiLCJQZXJtaXNzaW9ucy5TdGF0dXMuQWRkU3RhdHVzIiwiUGVybWlzc2lvbnMuU3RhdHVzLkFkZFN0YXR1c0xpc3QiLCJQZXJtaXNzaW9ucy5Vc2VyLkFkZFVzZXIiLCJQZXJtaXNzaW9ucy5Sb2xlVHlwZS5HZXRBbGxVc2VycyIsIlBlcm1pc3Npb25zLlJvbGVUeXBlLlNldE5ld1Bhc3N3b3JkIiwiUGVybWlzc2lvbnMuUm9sZVR5cGUuUmVtb3ZlVXNlciIsItin2YTYtdmB2K3YqSDYp9mE2LHYptmK2LPZitipIiwi2LnYsdi2INiz2LnYsSIsItiz2YbYr9in2Kog2KfZhNmC2KjYtiIsItiq2YbYqNmK2YfYp9iq2YoiLCLYp9mE2LXZgdit2Kkg2KfZhNix2KbZitiz2YrYqSIsIti52LHYtiDYs9i52LEiLCLYstixINin2YTYp9i22KfZgdipIiwi2KfZhNmG2YjYp9mC2LUiLCLYp9mE2KrZiNi12YrZhNin2Kog2KfZhNi12K3ZitipIiwi2KfZhNiq2YLYp9ix2YrYsSIsItiz2YbYr9in2Kog2KfZhNmC2KjYtiIsIti32KjYudipINin2YTYqtmI2KgiLCLZhdit2LbYsSDYp9iz2KrZgtio2KfZhCIsItin2YTYqtit2YTZitmEIiwi2KfZhNi12YrYp9mG2KkiLCLYt9mE2Kgg2KfZhtiq2KfYrCIsItin2YTZhdiq2KfYqNi52KfYqiIsItin2YTZhdmE2KfYrdi42KfYqiIsIti52YLYryIsItin2YTYp9i52K_Yp9iv2KfYqiIsItin2YTYqtmG2KjZitmH2KfYqiIsItiq2K3ZiNmK2YQg2KfZhNmJINi52YLYryIsIlBlcm1pc3Npb25zLkNsaWVudC5BZGQiLCJQZXJtaXNzaW9ucy5DbGllbnQuR2V0QWxsIiwiUGVybWlzc2lvbnMuQ2xpZW50LkdldFN0YXR1c0J5SWQiLCJQZXJtaXNzaW9ucy5DbGllbnQuRGVsZXRlIiwiUGVybWlzc2lvbnMuQ2xpZW50LlVwZGF0ZSIsIlBlcm1pc3Npb25zLkNsaWVudEZpbGUuQWRkIiwiUGVybWlzc2lvbnMuQ2xpZW50RmlsZS5HZXRBbGwiLCJQZXJtaXNzaW9ucy5DbGllbnRGaWxlLkdldFN0YXR1c0J5SWQiLCJQZXJtaXNzaW9ucy5DbGllbnRGaWxlLkRlbGV0ZSIsIlBlcm1pc3Npb25zLkNsaWVudEZpbGUuVXBkYXRlIl0sImV4cCI6MTY5MzM2NDc1OSwiaXNzIjoiTWF0YWJla2hfU3lzdGVtIn0.yB1Pt3Yhq3xnXg2dPPHLa6hvI_d84PevpLEkbfnPtdY",
      'Authorization': "Bearer ${CacheHelper.getData(key: AppConstants.token)}",
      // "Accept-Language":
      //     CacheHelper.getData(key: AppConstants.languageCode) == "en"
      //         ? "en-US"
      //         : "ar-EG"
    };
    options.queryParameters = {};

    return options;
  }

//this just returns the language key
}
