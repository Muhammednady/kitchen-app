import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../helper/network/dio_integration.dart';
import '../../../helper/network/error_handler.dart';
import '../../../model/response/basic_response_model.dart';
import '../../../model/response/client_emails_model.dart';
import '../../../model/response/get_clients_payment.dart';
import '../../../model/response/user_ids_model.dart';
import '../../../utill/app_constants.dart';

class PaymentService {
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

  // getShortClientFiles({int? pageType, finalStatusId, fileTypeId, userId}) async {
  //   try {
  //     final response = await dio!.get(AppConstants.getShortClientFiles, queryParameters: {
  //       "PageType": pageType,
  //       "finalStatusId": finalStatusId,
  //       "fileTypeId": fileTypeId,
  //       "userId": userId,
  //     });
  //     if (response.statusCode == 200) {
  //       log(response.data.toString());
  //
  //       return DataFilterModel.fromJson(response.data);
  //     } else {
  //       HandleError.handleException(response: response.statusCode);
  //     }
  //   } catch (e) {
  //     if (e is DioErrorType) {
  //       HandleError.handleExceptionDio(e);
  //     }
  //   }
  // }

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

  addClientPayment({
    int? clientId,
    String? checkNo,
    int? paidTypeId,
    String? notes,
    String? amount,
    String? paymentDate,
    String? checkDate,
  }) async {
    try {
      final response = await dio!.post(AppConstants.addClientPayment, data: {
        "clientId": clientId,
        "amount": amount,
        "paymentDate": '2023-11-28T13:57:39.242Z',
        "paidTypeId": paidTypeId,
        "notes": notes,
        "checkNo": checkNo,
        "checkDate": '2023-11-28T13:57:39.242Z'
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
