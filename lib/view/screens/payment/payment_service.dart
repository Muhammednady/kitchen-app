
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../helper/network/dio_integration.dart';
import '../../../helper/network/error_handler.dart';
import '../../../model/response/data_filter_model.dart';
import '../../../model/response/user_ids_model.dart';
import '../../../utill/app_constants.dart';

class PaymentService{
  final dio = DioUtilNew.dio;
  getAllUsers() async {
    try {
      final response = await dio!.get(AppConstants.getAllUsers);
      if (response.statusCode == 200) {
        return UserIdsModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
  getShortClientFiles({int? pageType, finalStatusId, fileTypeId, userId}) async {
    try {
      final response = await dio!.get(AppConstants.getShortClientFiles, queryParameters: {
        "PageType": pageType,
        "finalStatusId": finalStatusId,
        "fileTypeId": fileTypeId,
        "userId": userId,
      });
      if (response.statusCode == 200) {
        log(response.data.toString());

        return DataFilterModel.fromJson(response.data);
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