
import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/api/api-service.dart';
import 'package:flutter_nur_assignment/api/response-data/response-gettoken.dart';
import 'package:flutter_nur_assignment/locator/locator.dart';
import 'package:flutter_nur_assignment/model/return-object.dart';
import 'package:flutter_nur_assignment/utils/sp-utils.dart';

class LoginController extends ChangeNotifier{

  var _apiService = locator<ApiService>();
  var _spUtil = locator<SPUtil>();

  TextEditingController emailtextlogin = new TextEditingController();
  TextEditingController passwordtextlogin = new TextEditingController();
  Gettoken gettoken;


  Future<ReturnObj> login() async{


    if(emailtextlogin.text.isNotEmpty && passwordtextlogin.text.isNotEmpty){


      var apiResponse_logincrdential = await _apiService.getToken(emailtextlogin.text,passwordtextlogin.text);
      notifyListeners();

      if (apiResponse_logincrdential.httpCode == 200) {
        if (apiResponse_logincrdential.data != null) {
          gettoken = apiResponse_logincrdential.data;
          print("the token is  ${gettoken.token}");
          _spUtil.setValue(SPUtil.KEY_AUTH_TOKEN, gettoken.token);
        }


      }else {
        _spUtil.setValue(SPUtil.KEY_AUTH_TOKEN, "");
      }
      notifyListeners();
    }
  }
}