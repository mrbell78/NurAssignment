import 'package:flutter/cupertino.dart';
import 'package:flutter_nur_assignment/api/response-data/response-create-account.dart';
import 'package:flutter_nur_assignment/api/response-data/response-get-domain.dart';
import 'package:flutter_nur_assignment/api/response-data/response-mail-inbox.dart';
import 'package:flutter_nur_assignment/api/response-data/response-gettoken.dart';
import 'package:flutter_nur_assignment/locator/locator.dart';
import 'package:flutter_nur_assignment/utils/api-const.dart';

import 'api-generic-response.dart';
import 'http-service.dart';

class ApiService{


  var _httpService = locator<HttpService>();

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future<ApiResponse<ResponseDomainlist>> getDomain(String prams,String pageno) async {
    var apiResponse = await _httpService.getRequest(ApiConstant.BASE_URL+prams,qp: {"page":pageno});
    return ApiResponse(
      httpCode: apiResponse.httpCode,
      message: apiResponse.message,
      data: apiResponse.httpCode == 200 ? ResponseDomainlist.fromJson(apiResponse.data.data) : null,
    );
  }



  Future<ApiResponse<ResponseCreateAccount>> crteateAccount(String mail,String password) async {
    var apiResponse = await _httpService.postRequest(ApiConstant.BASE_URL+"accounts",data: {
      "address": mail,
      "password": password
    });
    return ApiResponse(
      httpCode: apiResponse.httpCode,
      message: apiResponse.message,
      data: apiResponse.httpCode == 200 ? ResponseCreateAccount.fromJson(apiResponse.data.data) : null,
    );
  }

  Future<ApiResponse<Gettoken>> getToken(String mail,String password) async {
    var apiResponse = await _httpService.postRequest(ApiConstant.BASE_URL+"token",data: {
      "address": mail,
      "password": password
    });
    return ApiResponse(
      httpCode: apiResponse.httpCode,
      message: apiResponse.message,
      data: apiResponse.httpCode == 200 ? Gettoken.fromJson(apiResponse.data.data) : null,
    );
  }

  Future<ApiResponse<ResponseMailInbox>>getMailbox() async {
    var apiResponse_getmailbox = await _httpService.getRequest(
      ApiConstant.BASE_URL+"messages",qp: {"page":"1"}
    );

    return ApiResponse(
      httpCode: apiResponse_getmailbox.httpCode,
      message: apiResponse_getmailbox.message,
      data: apiResponse_getmailbox.httpCode == 200 ? ResponseMailInbox.fromJson(apiResponse_getmailbox.data.data) : null,
    );
  }


}