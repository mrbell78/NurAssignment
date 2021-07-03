
import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/api/api-service.dart';
import 'package:flutter_nur_assignment/api/response-data/response-get-domain.dart';
import 'package:flutter_nur_assignment/locator/locator.dart';
import 'package:flutter_nur_assignment/utils/sp-utils.dart';

class HomePageController extends ChangeNotifier{

  var _apiService = locator<ApiService>();
  var _spUtil = locator<SPUtil>();

  ResponseDomainlist responseDomainlist;
  getDomain() async{


    var apiResponse = await _apiService.getDomain("domain","1");
    if (apiResponse.httpCode == 200) {
      if (apiResponse.data != null) {
        responseDomainlist=apiResponse.data;
      }
    } else {
      print("${apiResponse.message}");
    }
    notifyListeners();
  }

}