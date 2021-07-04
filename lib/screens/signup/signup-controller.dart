
import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/api/api-service.dart';
import 'package:flutter_nur_assignment/api/response-data/response-create-account.dart';
import 'package:flutter_nur_assignment/locator/locator.dart';
import 'package:flutter_nur_assignment/model/return-object.dart';

class SignupController extends ChangeNotifier{

  var _apiService = locator<ApiService>();

  ResponseCreateAccount responseCreateAccount;

  TextEditingController emailtext = new TextEditingController();
  TextEditingController passwordtext = new TextEditingController();


  Future<ReturnObj> createAccount() async{


    if(emailtext.text.isNotEmpty && passwordtext.text.isNotEmpty){

      var apiResponse = await _apiService.crteateAccount(emailtext.text,passwordtext.text);
      if (apiResponse.httpCode == 200) {
        if (apiResponse.data != null) {
          responseCreateAccount=apiResponse.data;
          print("the code is --------${apiResponse.httpCode}");
          print("the response data is ${responseCreateAccount.address}");
          return ReturnObj(success: true,data: responseCreateAccount);
        }
      } else {
        print("${apiResponse.message}");
      }
    }
    notifyListeners();
  }
}