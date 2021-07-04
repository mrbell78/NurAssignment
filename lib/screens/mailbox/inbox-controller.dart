

import 'package:flutter/material.dart';
import 'package:flutter_nur_assignment/api/api-service.dart';
import 'package:flutter_nur_assignment/api/response-data/response-mail-inbox.dart';
import 'package:flutter_nur_assignment/locator/locator.dart';
import 'package:flutter_nur_assignment/utils/sp-utils.dart';

class InboxController extends  ChangeNotifier{


  var _apiService = locator<ApiService>();
  var _spUtil = locator<SPUtil>();

  ResponseMailInbox responsemessages;

  getMessages() async{


    var apiResponse_messges = await _apiService.getMailbox();
    if (apiResponse_messges.httpCode == 200) {
      if (apiResponse_messges.data != null) {
        responsemessages=apiResponse_messges.data;
      }

    }
    notifyListeners();
  }

}