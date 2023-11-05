import 'dart:developer';

import 'package:Kitchen_system/model/response/production_requests_model.dart';
import 'package:dio/dio.dart';

import '../../../../helper/network/dio_integration.dart';
import '../../../../helper/network/error_handler.dart';
import '../../../../utill/app_constants.dart';

class ProductionRequestsServices{
  final dio = DioUtilNew.dio;

  getAllProductionRequests() async {
    try {
      final response = await dio!.get(AppConstants.getShortClientFiles);
      if (response.statusCode == 200) {
        log(response.data.toString());
        return ProductionRequestsModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

}