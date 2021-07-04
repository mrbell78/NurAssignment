
import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/api/api-service.dart';
import 'package:flutter_nur_assignment/api/response-data/response-create-account.dart';
import 'package:flutter_nur_assignment/api/response-data/response-gettoken.dart';
import 'package:flutter_nur_assignment/locator/locator.dart';
import 'package:flutter_nur_assignment/model/return-object.dart';
import 'package:flutter_nur_assignment/utils/sp-utils.dart';

class SignupController extends ChangeNotifier{

  var _apiService = locator<ApiService>();
  var _spUtil = locator<SPUtil>();

  ResponseCreateAccount responseCreateAccount;
  Gettoken gettoken;
  int  statuscode=0;

  TextEditingController emailtext = new TextEditingController();
  TextEditingController passwordtext = new TextEditingController();


  Future<ReturnObj> createAccount() async{


    if(emailtext.text.isNotEmpty && passwordtext.text.isNotEmpty){

      var apiResponse = await _apiService.crteateAccount(emailtext.text,passwordtext.text);
      notifyListeners();

      if(apiResponse.httpCode==201){
        if (apiResponse.data != null) {
          statuscode=apiResponse.httpCode;
          responseCreateAccount=apiResponse.data;
          print("the code is --------${apiResponse.httpCode}");
          print("the response data is ${apiResponse.data.address}");

          return ReturnObj(success: true,data: responseCreateAccount);

          /*  var apiResponse_logincrdential = await _apiService.getToken(responseCreateAccount.address,passwordtext.text);
          notifyListeners();

          if (apiResponse_logincrdential.httpCode == 200) {
            if (apiResponse_logincrdential.data != null) {
              gettoken = apiResponse_logincrdential.data;
              _spUtil.setValue(SPUtil.KEY_AUTH_TOKEN, gettoken.token);
            }

          return ReturnObj(success: true,data: responseCreateAccount);
        }*/
        } else {
          print("${apiResponse.message}");
        }
      }

    notifyListeners();
  }
}
}