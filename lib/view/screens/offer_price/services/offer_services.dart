import 'dart:developer';

import 'package:Kitchen_system/helper/network/dio_integration.dart';
import 'package:Kitchen_system/helper/network/error_handler.dart';
import 'package:Kitchen_system/model/response/basic_response_model.dart';
import 'package:Kitchen_system/model/response/data_filter_model.dart';
import 'package:Kitchen_system/model/response/details_offer_prices_model.dart';
import 'package:Kitchen_system/model/response/final_status_files_model.dart';
import 'package:Kitchen_system/model/response/item_model.dart';
import 'package:Kitchen_system/model/response/user_ids_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class OfferServices {
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

  getAllFinalStatus() async {
    try {
      final response = await dio!.get(AppConstants.getAllFinalStatus);
      if (response.statusCode == 200) {
        return FinalStatusFilesModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  changeFinalStatus({
    required int clientFileId,
    required int finalStatusId,
    required String notes,
  }) async {
    try {
      final response = await dio!.put(AppConstants.changeFinalStatus,
          data: {"clientFileId": clientFileId, "finalStatusId": finalStatusId, "notes": notes});
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

  getAllItemType({int? id}) async {
    try {
      final response = await dio!.get("${AppConstants.loadFinalStatusList}$id");
      if (response.statusCode == 200) {
        return ItemModel.fromJson(response.data);
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

  getDetails({int? id}) async {
    try {
      final response = await dio!.get("${AppConstants.getClientFileById}$id");
      if (response.statusCode == 200) {
        return DetailsOfferPricesModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  deleteOffer(BuildContext context, {int? id}) async {
    try {
      final response = await dio!.delete("${AppConstants.deleteClientFile}$id");
      if (response.statusCode == 200) {
        showCustomSnackBar("تم الحذف بنجاح", context, isError: false);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
