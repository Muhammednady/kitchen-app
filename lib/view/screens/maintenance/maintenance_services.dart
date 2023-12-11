import 'dart:developer';

import 'package:Kitchen_system/model/response/maintenance_model.dart';
import 'package:dio/dio.dart';

import '../../../helper/network/dio_integration.dart';
import '../../../helper/network/error_handler.dart';
import '../../../model/response/basic_response_model.dart';
import '../../../model/response/client_emails_model.dart';
import '../../../model/response/get_clients_payment.dart';
import '../../../utill/app_constants.dart';

class MaintenanceService {
  final dio = DioUtilNew.dio;

  getClient() async {
    try {
      final response = await dio!.get(AppConstants.getAllClients);
      if (response.statusCode == 200) {
        return ClientEmailsModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  getClientMaintenance(int clientFileId) async {
    try {
      final response = await dio!.get(
        '${AppConstants.getClientMaintenance}/$clientFileId',
      );
      if (response.statusCode == 200) {
        return MaintenanceModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      log('--------------------------------------------$e');

      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  addClientMaintenance({
   required int clientId,
  required  String note,
   required String date,
  }) async {
    try {
      final response =
          await dio!.post(AppConstants.addClientMaintenance, data: {
            "clientFileId": clientId,
            "notes": note,
            "tarkebDate": date,
          });
      if (response.statusCode == 200) {
        return BasicResponseModel.fromJson(response.data);
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
