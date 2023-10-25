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
      'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsImp0aSI6IjNmYzJkNmY5LTk5OGMtNDg0Zi05M2UwLTlkZTRmNzAzZDg2ZSIsInVpZCI6IjEiLCJQZXJtaXNzaW9uIjpbIlBlcm1pc3Npb25zLlN0YXR1c0NhdGVnb3J5LkFkZFN0YXR1c0NhdGVnb3J5IiwiUGVybWlzc2lvbnMuU3RhdHVzQ2F0ZWdvcnkuR2V0QWxsU3RhdHVzQ2F0ZWdvcnlzIiwiUGVybWlzc2lvbnMuU3RhdHVzQ2F0ZWdvcnkuR2V0U3RhdHVzQ2F0ZWdvcnlCeUlkIiwiUGVybWlzc2lvbnMuU3RhdHVzQ2F0ZWdvcnkuRGVsZXRlU3RhdHVzQ2F0ZWdvcnkiLCJQZXJtaXNzaW9ucy5TdGF0dXNDYXRlZ29yeS5VcGRhdGVTdGF0dXNDYXRlZ29yeSIsIlBlcm1pc3Npb25zLlN0YXR1cy5BZGRTdGF0dXMiLCJQZXJtaXNzaW9ucy5TdGF0dXMuQWRkU3RhdHVzTGlzdCIsIlBlcm1pc3Npb25zLlVzZXIuQWRkVXNlciIsIlBlcm1pc3Npb25zLlJvbGVUeXBlLkdldEFsbFVzZXJzIiwiUGVybWlzc2lvbnMuUm9sZVR5cGUuU2V0TmV3UGFzc3dvcmQiLCJQZXJtaXNzaW9ucy5Sb2xlVHlwZS5SZW1vdmVVc2VyIiwi2KfZhNi12YHYrdipINin2YTYsdim2YrYs9mK2KkiLCLYudix2LYg2LPYudixIiwi2LPZhtiv2KfYqiDYp9mE2YLYqNi2Iiwi2KrZhtio2YrZh9in2KrZiiIsItin2YTYtdmB2K3YqSDYp9mE2LHYptmK2LPZitipIiwi2LnYsdi2INiz2LnYsSIsItiy2LEg2KfZhNin2LbYp9mB2KkiLCLYp9mE2YbZiNin2YLYtSIsItin2YTYqtmI2LXZitmE2KfYqiDYp9mE2LXYrdmK2KkiLCLYp9mE2KrZgtin2LHZitixIiwi2LPZhtiv2KfYqiDYp9mE2YLYqNi2Iiwi2LfYqNi52Kkg2KfZhNiq2YjYqCIsItmF2K3YttixINin2LPYqtmC2KjYp9mEIiwi2KfZhNiq2K3ZhNmK2YQiLCLYp9mE2LXZitin2YbYqSIsIti32YTYqCDYp9mG2KrYp9isIiwi2KfZhNmF2KrYp9io2LnYp9iqIiwi2KfZhNmF2YTYp9it2LjYp9iqIiwi2LnZgtivIiwi2KfZhNin2LnYr9in2K_Yp9iqIiwi2KfZhNiq2YbYqNmK2YfYp9iqIiwi2KrYrdmI2YrZhCDYp9mE2Ykg2LnZgtivIiwiUGVybWlzc2lvbnMuQ2xpZW50LkFkZCIsIlBlcm1pc3Npb25zLkNsaWVudC5HZXRBbGwiLCJQZXJtaXNzaW9ucy5DbGllbnQuR2V0U3RhdHVzQnlJZCIsIlBlcm1pc3Npb25zLkNsaWVudC5EZWxldGUiLCJQZXJtaXNzaW9ucy5DbGllbnQuVXBkYXRlIiwiUGVybWlzc2lvbnMuQ2xpZW50RmlsZS5BZGQiLCJQZXJtaXNzaW9ucy5DbGllbnRGaWxlLkdldEFsbCIsIlBlcm1pc3Npb25zLkNsaWVudEZpbGUuR2V0U3RhdHVzQnlJZCIsIlBlcm1pc3Npb25zLkNsaWVudEZpbGUuRGVsZXRlIiwiUGVybWlzc2lvbnMuQ2xpZW50RmlsZS5VcGRhdGUiXSwiZXhwIjoxNjk4MjY4NDIyLCJpc3MiOiJNYXRhYmVraF9TeXN0ZW0ifQ.bRzzO0M31pEQdQ-U4TBwNVv9CdhT6zpH0wZGYe-IcP4",
      //'Authorization': "Bearer ${CacheHelper.getData(key: AppConstants.token)}",
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
