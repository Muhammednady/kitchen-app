import 'dart:developer';

import 'package:Kitchen_system/model/response/top_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../helper/network/dio_integration.dart';
import '../../../helper/network/error_handler.dart';
import '../../../model/response/data_filter_model.dart';
import '../../../model/response/get_clients_payment.dart';
import '../../../model/response/top_data_model.dart';
import '../../../utill/app_constants.dart';
import '../../base/custom_snackbar.dart';

class TopService {
  final dio = DioUtilNew.dio;

  getShortClientFiles(// {int? pageType, finalStatusId, fileTypeId, userId}
      ) async {
    try {
      final response = await dio!.get(
        AppConstants.getAllFileClientTop,
        //         queryParameters: {
        //   "PageType": pageType,
        //   "finalStatusId": finalStatusId,
        //   "fileTypeId": fileTypeId,
        //   "userId": userId,
        // }
      );
      if (response.statusCode == 200) {
        log(response.data.toString());

        return TopModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  deleteTop(BuildContext context, {int? id}) async {
    try {
      final response = await dio!
          .get(AppConstants.deleteClientFileTopById, queryParameters: {
        'Id': id,
      });
      log(response.statusMessage!);
      if (response.statusCode == 200) {
        if (context.mounted) {
          showCustomSnackBar("تم الحذف بنجاح", context, isError: false);
        }
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }



  // load units and values
  getTopPage() async {
    try {
      final response = await dio!.get(AppConstants.loadClientFileTopPage);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return TopDataModel.fromJson(response.data);

      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
      log(e.toString(),);
    }
  }

  Future getClientsPayment(int clientId) async {
    try {
      final response =
      await dio!.get(AppConstants.getClientPayment, queryParameters: {
        'clientId': clientId,
      });
      log('----------------------------$response');
      if (response.statusCode == 200) {
        log('${ClientPaymentModel.fromJson(response.data).toString()}---------- test ------------');

        log('testttttt-----------');
        return ClientPaymentModel.fromJson(response.data);
      } else {
        log('error testttttt-----------');
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      log('$e -----  error testttttt-----------');

      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
