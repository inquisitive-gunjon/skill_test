import 'package:flutter/material.dart';
import 'package:soft_bd_skill_test/data/datasource/remote/dio/dio_client.dart';
import 'package:soft_bd_skill_test/data/datasource/remote/exception/api_error_handler.dart';
import 'package:soft_bd_skill_test/data/repository/base/api_response.dart';
import 'package:soft_bd_skill_test/utill/app_constants.dart';

class PageTwoRepo {
  final DioClient dioClient;
  PageTwoRepo({@required this.dioClient});

  Future<ApiResponse> getPageTowData() async {
    try {
      final response = await dioClient.get(AppConstants.PAGE_TWO_API);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}